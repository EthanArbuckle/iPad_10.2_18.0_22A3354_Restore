@implementation IMPlayerChapterInfo

- (BOOL)isEqual:(id)a3
{
  IMPlayerChapterInfo *v4;
  IMPlayerChapterInfo *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (IMPlayerChapterInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[IMPlayerChapterInfo title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[IMPlayerChapterInfo title](v5, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 != 0;

      }
      else
      {
        v8 = 0;
      }

      -[IMPlayerChapterInfo externalURL](self, "externalURL");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[IMPlayerChapterInfo externalURL](v5, "externalURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          v13 = v8;
        else
          v13 = 0;
        if (v13)
        {
          -[IMPlayerChapterInfo title](self, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMPlayerChapterInfo title](v5, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v15))
          {
            -[IMPlayerChapterInfo externalURL](self, "externalURL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMPlayerChapterInfo externalURL](v5, "externalURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v16, "isEqual:", v17);

          }
          else
          {
            v9 = 0;
          }
          goto LABEL_23;
        }
        if (v8)
          goto LABEL_18;
        if (v12)
        {
          -[IMPlayerChapterInfo externalURL](self, "externalURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMPlayerChapterInfo externalURL](v5, "externalURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v14, "isEqual:", v15);
          goto LABEL_22;
        }
      }
      else if (v8)
      {
LABEL_18:
        -[IMPlayerChapterInfo title](self, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPlayerChapterInfo title](v5, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "isEqualToString:", v15);
LABEL_22:
        v9 = v18;
LABEL_23:

LABEL_25:
        goto LABEL_26;
      }
      v9 = 0;
      goto LABEL_25;
    }
    v9 = 0;
  }
LABEL_26:

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)externalURL
{
  return self->_externalURL;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)assetTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (int)type
{
  return self->_type;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)mediaTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (void)setMediaTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_mediaTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_mediaTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_mediaTimeRange.start.value = v3;
}

- (void)setAssetTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_assetTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_assetTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_assetTimeRange.start.value = v3;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (int)metadataType
{
  return self->_metadataType;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setMetadataType:(int)a3
{
  self->_metadataType = a3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (double)time
{
  return self->_time;
}

- (void)setArtworkData:(id)a3
{
  UIImage *artwork;
  id v6;

  objc_storeStrong((id *)&self->_artworkData, a3);
  v6 = a3;
  artwork = self->_artwork;
  self->_artwork = 0;

}

- (UIImage)artwork
{
  UIImage *artwork;
  UIImage *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  int v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  UIImage *v25;
  void *v26;
  UIImage *v27;
  UIImage *v28;
  UIImage *v29;
  CGSize v31;
  CGRect v32;

  artwork = self->_artwork;
  if (artwork)
  {
    v3 = artwork;
  }
  else
  {
    -[IMPlayerChapterInfo artworkData](self, "artworkData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3870];
      -[IMPlayerChapterInfo artworkData](self, "artworkData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithData:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "size");
      if (v10 > 600.0 || v9 > 600.0)
      {
        objc_msgSend(v8, "imageWithSize:preserveAspectRatio:", 1, 600.0, 600.0);
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v11;
      }
      objc_msgSend(v8, "size");
      if (v12 != v13)
      {
        v14 = v12;
        v15 = v13;
        if (v12 < v13)
          v12 = v13;
        if (v12 >= 140.0)
          v16 = v12;
        else
          v16 = 140.0;
        v17 = objc_msgSend(v8, "colorAtPixelX:y:", (unint64_t)(v14 + -1.0), 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(v17) / 255.0), (float)((float)BYTE1(v17) / 255.0), (float)((float)v17 / 255.0), (float)((float)HIBYTE(v17) / 255.0));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x1E0C9D538];
        v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v8, "scale");
        v22 = v21;
        v31.width = v16;
        v31.height = v16;
        UIGraphicsBeginImageContextWithOptions(v31, 1, v22);
        objc_msgSend(v18, "set");
        v32.origin.x = v19;
        v32.origin.y = v20;
        v32.size.width = v16;
        v32.size.height = v16;
        UIRectFill(v32);
        objc_msgSend(v8, "drawInRect:blendMode:alpha:", 0, CGRectCenterRectInRect(v19, v20, v14, v15, v19, v20, v16, v16));
        UIGraphicsGetImageFromCurrentImageContext();
        v23 = objc_claimAutoreleasedReturnValue();

        UIGraphicsEndImageContext();
        v8 = (void *)v23;
      }
      if (os_feature_enabled_red_sun())
      {
        objc_msgSend(v8, "imageByPreparingForDisplay");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (UIImage *)v24;
        if (v24)
          v26 = (void *)v24;
        else
          v26 = v8;
        v27 = v26;
        v28 = self->_artwork;
        self->_artwork = v27;

      }
      else
      {
        v29 = v8;
        v25 = self->_artwork;
        self->_artwork = v29;
      }

      v3 = self->_artwork;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[IMPlayerChapterInfo title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMPlayerChapterInfo externalURL](self, "externalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[IMPlayerChapterInfo title](self, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hash");
      -[IMPlayerChapterInfo externalURL](self, "externalURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)(objc_msgSend(v7, "hash") ^ v6);

    }
    else
    {
      v3 = 0;
    }
  }
  -[IMPlayerChapterInfo title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IMPlayerChapterInfo title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12 = v9;
    v3 = (void *)objc_msgSend(v9, "hash");

    return (unint64_t)v3;
  }
  -[IMPlayerChapterInfo externalURL](self, "externalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IMPlayerChapterInfo externalURL](self, "externalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[IMPlayerChapterInfo artwork](self, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IMPlayerChapterInfo artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  return (unint64_t)v3;
}

- (id)description
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  CMTimeRange v16;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = off_1EA0C5B60[-[IMPlayerChapterInfo type](self, "type")];
  v5 = qword_1EA0C5B70[-[IMPlayerChapterInfo metadataType](self, "metadataType")];
  -[IMPlayerChapterInfo title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayerChapterInfo externalURL](self, "externalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayerChapterInfo time](self, "time");
  v9 = v8;
  -[IMPlayerChapterInfo duration](self, "duration");
  v11 = v10;
  -[IMPlayerChapterInfo mediaTimeRange](self, "mediaTimeRange");
  v12 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  -[IMPlayerChapterInfo assetTimeRange](self, "assetTimeRange");
  v13 = (__CFString *)CMTimeRangeCopyDescription(0, &v16);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p> type=%s metadata_type=%s title=\"%@\" url=\"%@\" time=%f duration=%f mediaTimeRange=%@ assetTimeRange=%@"), self, v4, v5, v6, v7, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setExternalURL:(id)a3
{
  objc_storeStrong((id *)&self->_externalURL, a3);
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_externalURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
