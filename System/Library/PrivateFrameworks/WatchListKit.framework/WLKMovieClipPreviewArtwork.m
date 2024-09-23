@implementation WLKMovieClipPreviewArtwork

- (WLKMovieClipPreviewArtwork)initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  WLKMovieClipPreviewArtwork *v24;

  v4 = a3;
  if (v4)
  {
    v5 = -[WLKMovieClipPreviewArtwork _init](self, "_init");
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("bgColor"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v5[2];
      v5[2] = v6;

      *((_BYTE *)v5 + 8) = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("supportsLayeredImage"), 0);
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("textColor1"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v5[3];
      v5[3] = v8;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("textColor2"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v5[4];
      v5[4] = v10;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("textColor3"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v5[5];
      v5[5] = v12;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("textColor4"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v5[5];
      v5[5] = v14;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v5[7];
      v5[7] = v16;

      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("height"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("width"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18 && v19)
      {
        objc_msgSend(v19, "doubleValue");
        v22 = v21;
        objc_msgSend(v18, "doubleValue");
        v5[8] = v22;
        v5[9] = v23;
      }

    }
    self = v5;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClipPreviewArtwork;
  return -[WLKMovieClipPreviewArtwork init](&v3, sel_init);
}

- (WLKMovieClipPreviewArtwork)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKMovieClipPreviewArtwork"), CFSTR("-init is not supported. Use -initWithDictionary:"));

  return 0;
}

- (WLKArtworkVariant)artworkVariant
{
  void *v4;
  void *v5;
  void *v6;
  WLKArtworkVariant *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  if (!self->_url)
    return (WLKArtworkVariant *)0;
  if (*MEMORY[0x1E0C9D820] == self->_artworkSize.width
    && *(double *)(MEMORY[0x1E0C9D820] + 8) == self->_artworkSize.height)
  {
    return (WLKArtworkVariant *)0;
  }
  v9[0] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_artworkSize.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v10[2] = CFSTR("jpg");
  v9[2] = CFSTR("format");
  v9[3] = CFSTR("url");
  v10[3] = self->_url;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WLKArtworkVariant initWithDictionary:]([WLKArtworkVariant alloc], "initWithDictionary:", v6);
  return v7;
}

- (CGSize)artworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (NSString)bgColor
{
  return self->_bgColor;
}

- (NSString)textColor1
{
  return self->_textColor1;
}

- (NSString)textColor2
{
  return self->_textColor2;
}

- (NSString)textColor3
{
  return self->_textColor3;
}

- (NSString)textColor4
{
  return self->_textColor4;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textColor4, 0);
  objc_storeStrong((id *)&self->_textColor3, 0);
  objc_storeStrong((id *)&self->_textColor2, 0);
  objc_storeStrong((id *)&self->_textColor1, 0);
  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end
