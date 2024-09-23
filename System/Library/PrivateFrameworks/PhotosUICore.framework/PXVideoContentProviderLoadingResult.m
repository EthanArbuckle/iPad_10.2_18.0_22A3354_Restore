@implementation PXVideoContentProviderLoadingResult

- (PXVideoContentProviderLoadingResult)initWithPlayerItem:(id)a3 url:(id)a4 timeRange:(id *)a5 timeRangeMapper:(id)a6 error:(id)a7 priority:(int64_t)a8 description:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  void *v25;
  id v28;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v28 = a6;
  v17 = a7;
  v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PXVideoContentProviderLoadingResult;
  v19 = -[PXVideoContentProviderLoadingResult init](&v29, sel_init);
  if (v19)
  {
    if (!v15 && !v16 && !v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PXVideoContentProvider.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playerItem || url || error"));

    }
    objc_storeStrong((id *)v19 + 1, a3);
    objc_storeStrong((id *)v19 + 2, a4);
    v20 = *(_OWORD *)&a5->var0.var0;
    v21 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)(v19 + 88) = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)(v19 + 72) = v21;
    *(_OWORD *)(v19 + 56) = v20;
    objc_storeStrong((id *)v19 + 3, a7);
    *((_QWORD *)v19 + 4) = a8;
    v22 = objc_msgSend(v18, "copy");
    v23 = (void *)*((_QWORD *)v19 + 5);
    *((_QWORD *)v19 + 5) = v22;

    objc_storeStrong((id *)v19 + 6, a6);
  }

  return (PXVideoContentProviderLoadingResult *)v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE v11[48];
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PXVideoContentProviderLoadingResult;
  -[PXVideoContentProviderLoadingResult description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoContentProviderLoadingResult timeRange](self, "timeRange");
  PXCMTimeRangeDescription((uint64_t)v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoContentProviderLoadingResult playerItem](self, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoContentProviderLoadingResult url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoContentProviderLoadingResult error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, TimeRange: %@, PlayerItem: %@, URL: %@, Error: %@, Priority: %ld"), v4, v5, v6, v7, v8, -[PXVideoContentProviderLoadingResult priority](self, "priority"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (NSURL)url
{
  return self->_url;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)resultDebugDescription
{
  return self->_resultDebugDescription;
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_resultDebugDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
