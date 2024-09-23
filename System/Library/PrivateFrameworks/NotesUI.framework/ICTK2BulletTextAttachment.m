@implementation ICTK2BulletTextAttachment

- (ICTK2BulletTextAttachment)initWithMarker:(id)a3
{
  id v5;
  uint64_t v6;
  ICTK2BulletTextAttachment *v7;
  ICTK2BulletTextAttachment *v8;
  objc_super v10;

  v5 = a3;
  v6 = *MEMORY[0x1E0D63668];
  v10.receiver = self;
  v10.super_class = (Class)ICTK2BulletTextAttachment;
  v7 = -[ICTextAttachment initWithData:ofType:](&v10, sel_initWithData_ofType_, 0, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_marker, a3);

  return v8;
}

+ (NSMutableDictionary)imageCache
{
  if (imageCache_onceToken_0 != -1)
    dispatch_once(&imageCache_onceToken_0, &__block_literal_global_33);
  return (NSMutableDictionary *)(id)imageCache_imageCache_0;
}

void __39__ICTK2BulletTextAttachment_imageCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageCache_imageCache_0;
  imageCache_imageCache_0 = v0;

}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3;
  -[ICTK2BulletTextAttachment marker](self, "marker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTK2BulletTextAttachment marker](self, "marker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    objc_msgSend(v6, "boundingRectWithSize:options:context:", 1, 0);
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  return 0;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend((id)objc_opt_class(), "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2BulletTextAttachment marker](self, "marker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__ICTK2BulletTextAttachment_imageForBounds_attributes_location_textContainer___block_invoke;
    v19[3] = &unk_1E5C1D740;
    v19[4] = self;
    objc_msgSend(v13, "imageWithActions:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2BulletTextAttachment marker](self, "marker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    v12 = v14;
  }
  v17 = v12;

  return v17;
}

void __78__ICTK2BulletTextAttachment_imageForBounds_attributes_location_textContainer___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "marker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (NSAttributedString)marker
{
  return self->_marker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
}

@end
