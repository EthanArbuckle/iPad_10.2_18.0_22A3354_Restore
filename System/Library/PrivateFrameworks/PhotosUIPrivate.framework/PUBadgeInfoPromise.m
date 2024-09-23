@implementation PUBadgeInfoPromise

- (PUBadgeInfoPromise)init
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v4[0] = *MEMORY[0x1E0D7CE00];
  v4[1] = v2;
  return -[PUBadgeInfoPromise initWithBadgeInfo:](self, "initWithBadgeInfo:", v4);
}

- (PUBadgeInfoPromise)initWithBadgeInfo:(PXAssetBadgeInfo *)a3
{
  __int128 v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PUBadgeInfoPromise_initWithBadgeInfo___block_invoke;
  v5[3] = &__block_descriptor_64_e27__PXAssetBadgeInfo_Qdqq_8__0l;
  v3 = *(_OWORD *)&a3->count;
  v6 = *(_OWORD *)&a3->badges;
  v7 = v3;
  return -[PUBadgeInfoPromise initWithBadgeInfoProvider:countProvider:](self, "initWithBadgeInfoProvider:countProvider:", v5, 0);
}

- (PUBadgeInfoPromise)initWithBadgeInfoProvider:(id)a3 countProvider:(id)a4
{
  id v7;
  id v8;
  PUBadgeInfoPromise *v9;
  void *v10;
  id badgeProvider;
  void *v12;
  id countProvider;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUBadgeInfoPromise;
  v9 = -[PUBadgeInfoPromise init](&v16, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PUBadgeInfoPromise.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("badgeProvider != nil"));

    }
    v10 = _Block_copy(v7);
    badgeProvider = v9->_badgeProvider;
    v9->_badgeProvider = v10;

    v12 = _Block_copy(v8);
    countProvider = v9->_countProvider;
    v9->_countProvider = v12;

  }
  return v9;
}

- (unint64_t)hash
{
  return self->_badgeInfo.badges ^ (2 * (uint64_t)self->_badgeInfo.duration);
}

- (BOOL)isEqual:(id)a3
{
  PUBadgeInfoPromise *v4;
  PUBadgeInfoPromise *v5;
  char v6;

  v4 = (PUBadgeInfoPromise *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_badgeInfo.badges == v5->_badgeInfo.badges)
      {
        if (PXAssetBadgeInfoRequiresCountForBadges())
        {
          -[PUBadgeInfoPromise badgeInfo](self, "badgeInfo");
          -[PUBadgeInfoPromise badgeInfo](v5, "badgeInfo");
        }
        v6 = PXAssetBadgeInfoEqualToBadgeInfo();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (PXAssetBadgeInfo)badgeInfo
{
  PUBadgeInfoPromise *v4;
  void (**badgeProvider)(_OWORD *__return_ptr);
  __int128 v6;
  id v7;
  id countProvider;
  uint64_t (**v9)(_QWORD);
  id v10;
  PXAssetBadgeInfo *result;
  __int128 v12;
  _OWORD v13[2];

  v4 = self;
  objc_sync_enter(v4);
  badgeProvider = (void (**)(_OWORD *__return_ptr))v4->_badgeProvider;
  if (badgeProvider)
  {
    badgeProvider[2](v13);
    v6 = v13[1];
    *(_OWORD *)&v4->_badgeInfo.badges = v13[0];
    *(_OWORD *)&v4->_badgeInfo.count = v6;
    v7 = v4->_badgeProvider;
    v4->_badgeProvider = 0;

  }
  countProvider = v4->_countProvider;
  if (countProvider)
  {
    v9 = (uint64_t (**)(_QWORD))_Block_copy(countProvider);
    v10 = v4->_countProvider;
    v4->_countProvider = 0;

    v4->_badgeInfo.count = v9[2](v9);
  }
  objc_sync_exit(v4);

  v12 = *(_OWORD *)&v4->_badgeInfo.count;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&v4->_badgeInfo.badges;
  *(_OWORD *)&retstr->count = v12;
  return result;
}

- (PUBadgeInfoPromise)badgeInfoPromiseWithAdjustments:(id)a3
{
  id v5;
  PUBadgeInfoPromise *v6;
  id countProvider;
  id v8;
  PUBadgeInfoPromise *v9;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBadgeInfoPromise.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjuster != nil"));

  }
  v6 = [PUBadgeInfoPromise alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PUBadgeInfoPromise_badgeInfoPromiseWithAdjustments___block_invoke;
  v12[3] = &unk_1E589D348;
  v12[4] = self;
  v13 = v5;
  countProvider = self->_countProvider;
  v8 = v5;
  v9 = -[PUBadgeInfoPromise initWithBadgeInfoProvider:countProvider:](v6, "initWithBadgeInfoProvider:countProvider:", v12, countProvider);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_badgeProvider, 0);
  objc_storeStrong(&self->_countProvider, 0);
}

uint64_t __54__PUBadgeInfoPromise_badgeInfoPromiseWithAdjustments___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _OWORD *, uint64_t, uint64_t);
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v6 = 0uLL;
  v12 = 0u;
  v13 = 0u;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "badgeInfo");
    v6 = 0uLL;
  }
  *a4 = v6;
  a4[1] = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v8 + 16);
  v11[0] = v12;
  v11[1] = v13;
  return v9(v8, v11, a2, a3);
}

__n128 __40__PUBadgeInfoPromise_initWithBadgeInfo___block_invoke@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

@end
