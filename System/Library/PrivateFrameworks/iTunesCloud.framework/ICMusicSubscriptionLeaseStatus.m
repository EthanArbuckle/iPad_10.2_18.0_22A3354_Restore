@implementation ICMusicSubscriptionLeaseStatus

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t leaseState;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_shouldPlaybackRequireOnlineKeys)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_hasOnlinePlaybackKeys)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_hasOfflinePlaybackKeys)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_hasPendingLeaseAcquisition)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_hasInflightLeaseAcquisition)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_takenDueToLeasePrevention)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  leaseState = self->_leaseState;
  v20 = v3;
  if (leaseState > 2)
    v14 = 0;
  else
    v14 = off_1E438B100[leaseState];
  if (self->_stateReasonDialog)
  {
    v15 = v8;
    v16 = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self->_stateReasonDialog);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@ %p shouldPlaybackRequireOnlineKeys: %@; hasOnlinePlaybackKeys: %@; hasOfflinePlaybackKeys: %@; hasPendingLeaseAcquisition: %@, hasInflightLeaseAcquisition: %@, isTakenDueToLeasePrevention:%@, leaseState: %@; stateReasonDialog: %@>"),
      v6,
      self,
      v7,
      v15,
      v16,
      v10,
      v11,
      v12,
      v14,
      v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p shouldPlaybackRequireOnlineKeys: %@; hasOnlinePlaybackKeys: %@; hasOfflinePlaybackKeys: %@; hasPendingLeaseAcquisition: %@, hasInflightLeaseAcquisition: %@, isTakenDueToLeasePrevention:%@, leaseState: %@; stateReasonDialog: %@>"),
      v5,
      self,
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v14,
      0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (unint64_t)hash
{
  uint8x8_t v2;
  uint32x4_t v4;
  int64x2_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  int64_t leaseState;
  uint64_t v10;

  v2.i32[0] = *(_DWORD *)&self->_hasOnlinePlaybackKeys;
  v4 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v2)));
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  v6 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL);
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  v7 = vorrq_s8(vbicq_s8((int8x16_t)xmmword_1A06E75D0, v6), vbicq_s8((int8x16_t)xmmword_1A06E75C0, (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL)));
  v8 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) | (32
                                                                                              * self->_takenDueToLeasePrevention) | self->_shouldPlaybackRequireOnlineKeys;
  leaseState = self->_leaseState;
  v10 = leaseState ^ -[ICStoreDialogResponse hash](self->_stateReasonDialog, "hash");
  return v8 ^ v10 ^ -[NSDictionary hash](self->_stateReasonDialogMetricsDictionary, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ICMusicSubscriptionLeaseStatus *v4;
  _BOOL4 shouldPlaybackRequireOnlineKeys;
  _BOOL4 hasOnlinePlaybackKeys;
  _BOOL4 hasOfflinePlaybackKeys;
  _BOOL4 hasPendingLeaseAcquisition;
  _BOOL4 hasInflightLeaseAcquisition;
  _BOOL4 takenDueToLeasePrevention;
  int64_t leaseState;
  ICStoreDialogResponse *stateReasonDialog;
  uint64_t v13;
  void *v14;
  ICStoreDialogResponse *v15;
  void *v16;
  char v17;
  NSDictionary *stateReasonDialogMetricsDictionary;
  NSDictionary *v20;
  NSDictionary *v21;
  void *v22;

  v4 = (ICMusicSubscriptionLeaseStatus *)a3;
  if (v4 == self)
  {
    v17 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  shouldPlaybackRequireOnlineKeys = self->_shouldPlaybackRequireOnlineKeys;
  if (shouldPlaybackRequireOnlineKeys != -[ICMusicSubscriptionLeaseStatus shouldPlaybackRequireOnlineKeys](v4, "shouldPlaybackRequireOnlineKeys"))goto LABEL_12;
  hasOnlinePlaybackKeys = self->_hasOnlinePlaybackKeys;
  if (hasOnlinePlaybackKeys != -[ICMusicSubscriptionLeaseStatus hasOnlinePlaybackKeys](v4, "hasOnlinePlaybackKeys"))
    goto LABEL_12;
  hasOfflinePlaybackKeys = self->_hasOfflinePlaybackKeys;
  if (hasOfflinePlaybackKeys != -[ICMusicSubscriptionLeaseStatus hasOfflinePlaybackKeys](v4, "hasOfflinePlaybackKeys"))
    goto LABEL_12;
  hasPendingLeaseAcquisition = self->_hasPendingLeaseAcquisition;
  if (hasPendingLeaseAcquisition != -[ICMusicSubscriptionLeaseStatus hasPendingLeaseAcquisition](v4, "hasPendingLeaseAcquisition"))goto LABEL_12;
  hasInflightLeaseAcquisition = self->_hasInflightLeaseAcquisition;
  if (hasInflightLeaseAcquisition != -[ICMusicSubscriptionLeaseStatus hasInflightLeaseAcquisition](v4, "hasInflightLeaseAcquisition"))goto LABEL_12;
  takenDueToLeasePrevention = self->_takenDueToLeasePrevention;
  if (takenDueToLeasePrevention != -[ICMusicSubscriptionLeaseStatus isTakenDueToLeasePrevention](v4, "isTakenDueToLeasePrevention"))goto LABEL_12;
  leaseState = self->_leaseState;
  if (leaseState != -[ICMusicSubscriptionLeaseStatus leaseState](v4, "leaseState"))
    goto LABEL_12;
  stateReasonDialog = self->_stateReasonDialog;
  -[ICMusicSubscriptionLeaseStatus stateReasonDialog](v4, "stateReasonDialog");
  v13 = objc_claimAutoreleasedReturnValue();
  if (stateReasonDialog == (ICStoreDialogResponse *)v13)
  {

  }
  else
  {
    v14 = (void *)v13;
    v15 = self->_stateReasonDialog;
    -[ICMusicSubscriptionLeaseStatus stateReasonDialog](v4, "stateReasonDialog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[ICStoreDialogResponse isEqual:](v15, "isEqual:", v16);

    if (!(_DWORD)v15)
    {
LABEL_12:
      v17 = 0;
      goto LABEL_14;
    }
  }
  stateReasonDialogMetricsDictionary = self->_stateReasonDialogMetricsDictionary;
  -[ICMusicSubscriptionLeaseStatus stateReasonDialogMetricsDictionary](v4, "stateReasonDialogMetricsDictionary");
  v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (stateReasonDialogMetricsDictionary == v20)
  {
    v17 = 1;
  }
  else
  {
    v21 = self->_stateReasonDialogMetricsDictionary;
    -[ICMusicSubscriptionLeaseStatus stateReasonDialogMetricsDictionary](v4, "stateReasonDialogMetricsDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSDictionary isEqualToDictionary:](v21, "isEqualToDictionary:", v22);

  }
LABEL_14:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[2] = (id)self->_leaseState;
    *((_BYTE *)v4 + 11) = self->_hasPendingLeaseAcquisition;
    *((_BYTE *)v4 + 12) = self->_hasInflightLeaseAcquisition;
    *((_BYTE *)v4 + 9) = self->_hasOnlinePlaybackKeys;
    *((_BYTE *)v4 + 10) = self->_hasOfflinePlaybackKeys;
    *((_BYTE *)v4 + 13) = self->_takenDueToLeasePrevention;
    *((_BYTE *)v4 + 8) = self->_shouldPlaybackRequireOnlineKeys;
    objc_storeStrong(v4 + 3, self->_stateReasonDialog);
    objc_storeStrong(v5 + 4, self->_stateReasonDialogMetricsDictionary);
  }
  return v5;
}

- (BOOL)shouldPlaybackRequireOnlineKeys
{
  return self->_shouldPlaybackRequireOnlineKeys;
}

- (void)setShouldPlaybackRequireOnlineKeys:(BOOL)a3
{
  self->_shouldPlaybackRequireOnlineKeys = a3;
}

- (BOOL)hasOnlinePlaybackKeys
{
  return self->_hasOnlinePlaybackKeys;
}

- (void)setHasOnlinePlaybackKeys:(BOOL)a3
{
  self->_hasOnlinePlaybackKeys = a3;
}

- (BOOL)hasOfflinePlaybackKeys
{
  return self->_hasOfflinePlaybackKeys;
}

- (void)setHasOfflinePlaybackKeys:(BOOL)a3
{
  self->_hasOfflinePlaybackKeys = a3;
}

- (BOOL)hasPendingLeaseAcquisition
{
  return self->_hasPendingLeaseAcquisition;
}

- (void)setHasPendingLeaseAcquisition:(BOOL)a3
{
  self->_hasPendingLeaseAcquisition = a3;
}

- (BOOL)hasInflightLeaseAcquisition
{
  return self->_hasInflightLeaseAcquisition;
}

- (void)setHasInflightLeaseAcquisition:(BOOL)a3
{
  self->_hasInflightLeaseAcquisition = a3;
}

- (BOOL)isTakenDueToLeasePrevention
{
  return self->_takenDueToLeasePrevention;
}

- (void)setTakenDueToLeasePrevention:(BOOL)a3
{
  self->_takenDueToLeasePrevention = a3;
}

- (int64_t)leaseState
{
  return self->_leaseState;
}

- (void)setLeaseState:(int64_t)a3
{
  self->_leaseState = a3;
}

- (ICStoreDialogResponse)stateReasonDialog
{
  return self->_stateReasonDialog;
}

- (void)setStateReasonDialog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)stateReasonDialogMetricsDictionary
{
  return self->_stateReasonDialogMetricsDictionary;
}

- (void)setStateReasonDialogMetricsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateReasonDialogMetricsDictionary, 0);
  objc_storeStrong((id *)&self->_stateReasonDialog, 0);
}

@end
