@implementation TVPAVTimedMetadataGroupChapter

- (TVPAVTimedMetadataGroupChapter)initWithAVTimedMetadataGroup:(id)a3 filterByLanguages:(id)a4
{
  id v6;
  id v7;
  TVPAVTimedMetadataGroupChapter *v8;
  TVPTimeRange *v9;
  uint64_t v10;
  TVPTimeRange *timeRange;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TVPAVTimedMetadataGroupChapter;
  v8 = -[TVPAVTimedMetadataGroupChapter init](&v24, sel_init);
  if (v8)
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    if (v6)
    {
      objc_msgSend(v6, "timeRange");
      if ((BYTE12(v21) & 1) != 0
        && (BYTE4(v23) & 1) != 0
        && !*((_QWORD *)&v23 + 1)
        && (*((_QWORD *)&v22 + 1) & 0x8000000000000000) == 0)
      {
        v9 = [TVPTimeRange alloc];
        v20[0] = v21;
        v20[1] = v22;
        v20[2] = v23;
        v10 = -[TVPTimeRange initWithCMTimeRange:](v9, "initWithCMTimeRange:", v20);
        timeRange = v8->super.super._timeRange;
        v8->super.super._timeRange = (TVPTimeRange *)v10;

        objc_msgSend(v6, "items");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withKey:keySpace:", v12, *MEMORY[0x24BDB1DA0], 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withKey:keySpace:", v12, *MEMORY[0x24BDB1D90], 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[TVPAVTimedMetadataGroupChapter setImageMetadataItem:](v8, "setImageMetadataItem:", v15);
        objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v13, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count"))
        {
          v17 = v13;

          v16 = v17;
        }
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPAVTimedMetadataGroupChapter _loadChapterNameFromMetadataItem:](v8, "_loadChapterNameFromMetadataItem:", v18);

      }
    }
  }

  return v8;
}

- (void)_loadChapterNameFromMetadataItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("value"), 0);
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        objc_msgSend(v5, "stringValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPChapter setLocalizedName:](self, "setLocalizedName:", v7);

      }
      else
      {
        objc_initWeak(&location, self);
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke;
        v8[3] = &unk_24F15C218;
        v9 = v5;
        objc_copyWeak(&v10, &location);
        objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24F1738F8, v8);
        objc_destroyWeak(&v10);

        objc_destroyWeak(&location);
      }
    }
  }

}

void __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("value"), 0) == 2)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke_2;
    v2[3] = &unk_24F15BA88;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v2);

    objc_destroyWeak(&v4);
  }
}

void __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLocalizedName:", v2);

}

- (AVMetadataItem)imageMetadataItem
{
  return self->_imageMetadataItem;
}

- (void)setImageMetadataItem:(id)a3
{
  objc_storeStrong((id *)&self->_imageMetadataItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMetadataItem, 0);
}

@end
