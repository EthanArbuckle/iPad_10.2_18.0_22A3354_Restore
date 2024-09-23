@implementation PXAudioRequestOptions

- (PXAudioRequestOptions)init
{
  PXAudioRequestOptions *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAudioRequestOptions;
  result = -[PXAudioRequestOptions init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_preferredDuration.value = *MEMORY[0x1E0CA2E18];
    result->_preferredDuration.epoch = *(_QWORD *)(v3 + 16);
    result->_networkAccessAllowed = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXAudioRequestOptions *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = objc_alloc_init(PXAudioRequestOptions);
  -[PXAudioRequestOptions preferredDuration](self, "preferredDuration");
  v15 = v17;
  v16 = v18;
  -[PXAudioRequestOptions setPreferredDuration:](v4, "setPreferredDuration:", &v15);
  -[PXAudioRequestOptions setNetworkAccessAllowed:](v4, "setNetworkAccessAllowed:", -[PXAudioRequestOptions networkAccessAllowed](self, "networkAccessAllowed"));
  -[PXAudioRequestOptions setIntent:](v4, "setIntent:", -[PXAudioRequestOptions intent](self, "intent"));
  -[PXAudioRequestOptions entryPoint](self, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAudioRequestOptions setEntryPoint:](v4, "setEntryPoint:", v5);

  -[PXAudioRequestOptions fadeOutDuration](self, "fadeOutDuration");
  v11 = v13;
  v12 = v14;
  -[PXAudioRequestOptions setFadeOutDuration:](v4, "setFadeOutDuration:", &v11);
  -[PXAudioRequestOptions maximumDuration](self, "maximumDuration");
  v7 = v9;
  v8 = v10;
  -[PXAudioRequestOptions setMaximumDuration:](v4, "setMaximumDuration:", &v7);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  int v7;
  int64_t v8;
  id v9;
  id v10;
  int v11;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime time2;
  CMTime time1;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXAudioRequestOptions preferredDuration](self, "preferredDuration");
    if (v5)
      objc_msgSend(v5, "preferredDuration");
    else
      memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&time1, &time2)
      || (v7 = -[PXAudioRequestOptions networkAccessAllowed](self, "networkAccessAllowed"),
          v7 != objc_msgSend(v5, "networkAccessAllowed"))
      || (v8 = -[PXAudioRequestOptions intent](self, "intent"), v8 != objc_msgSend(v5, "intent")))
    {
      v6 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[PXAudioRequestOptions entryPoint](self, "entryPoint");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryPoint");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {

    }
    else
    {
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_20;
    }
    -[PXAudioRequestOptions fadeOutDuration](self, "fadeOutDuration");
    if (v5)
      objc_msgSend(v5, "fadeOutDuration");
    else
      memset(&v15, 0, sizeof(v15));
    if (!CMTimeCompare(&v16, &v15))
    {
      -[PXAudioRequestOptions maximumDuration](self, "maximumDuration");
      if (v5)
        objc_msgSend(v5, "maximumDuration");
      else
        memset(&v13, 0, sizeof(v13));
      v6 = CMTimeCompare(&v14, &v13) == 0;
      goto LABEL_25;
    }
LABEL_20:
    v6 = 0;
LABEL_25:

    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 preferredDuration;

  preferredDuration = self->_preferredDuration;
  v3 = self->_networkAccessAllowed | (32 * (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration));
  v4 = v3 ^ -[PXAudioAssetEntryPoint hash](self->_entryPoint, "hash");
  preferredDuration = self->_fadeOutDuration;
  Seconds = (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration);
  preferredDuration = self->_maximumDuration;
  return v4 ^ (32 * (Seconds ^ (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration))) ^ self->_intent;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setPreferredDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_preferredDuration.epoch = a3->var3;
  *(_OWORD *)&self->_preferredDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setFadeOutDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setMaximumDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- (BOOL)networkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (PXAudioAssetEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  objc_storeStrong((id *)&self->_entryPoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
