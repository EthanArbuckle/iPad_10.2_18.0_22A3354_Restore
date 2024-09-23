@implementation ICThumbnailGeneratorAvatar

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, ICThumbnailDescription *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  ICThumbnailDescription *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, ICThumbnailDescription *))a4;
  objc_opt_class();
  objc_msgSend(v6, "associatedObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97200]);
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = (void *)MEMORY[0x1E0C97460];
  objc_msgSend(v6, "preferredSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "scale");
  objc_msgSend(v12, "scopeWithPointSize:scale:rightToLeft:style:", -[ICThumbnailGeneratorAvatar isRTL](self, "isRTL"), 0, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ICThumbnailDescription initWithConfiguration:]([ICThumbnailDescription alloc], "initWithConfiguration:", v6);
  -[ICThumbnailGeneratorAvatar renderer](self, "renderer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "avatarImageForContacts:scope:", v9, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasBorder"))
  {
    v22 = objc_alloc(MEMORY[0x1E0DC3828]);
    objc_msgSend(v21, "size");
    v23 = (void *)objc_msgSend(v22, "initWithSize:");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__ICThumbnailGeneratorAvatar_generateThumbnailWithConfiguration_completion___block_invoke;
    v24[3] = &unk_1E5C1D568;
    v24[4] = self;
    v25 = v21;
    objc_msgSend(v23, "imageWithActions:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ICThumbnailDescription setImage:](v19, "setImage:", v21);
  if (v7)
    v7[2](v7, v19);

}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (ICThumbnailGeneratorAvatar)initWithManagedObjectContext:(id)a3
{
  ICThumbnailGeneratorAvatar *v3;
  CNAvatarImageRenderer *v4;
  CNAvatarImageRenderer *renderer;
  ICThumbnailGeneratorAvatar *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICThumbnailGeneratorAvatar;
  v3 = -[ICThumbnailGenerator initWithManagedObjectContext:](&v8, sel_initWithManagedObjectContext_, a3);
  if (v3)
  {
    v4 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x1E0C97450]);
    renderer = v3->_renderer;
    v3->_renderer = v4;

    v7 = v3;
    performBlockOnMainThread();

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

uint64_t __59__ICThumbnailGeneratorAvatar_initWithManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3F10], "ic_isRTL");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t __76__ICThumbnailGeneratorAvatar_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithBorderIntoContext:avatarImage:", objc_msgSend(a2, "CGContext"), *(_QWORD *)(a1 + 40));
}

- (void)drawWithBorderIntoContext:(CGContext *)a3 avatarImage:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  id v10;
  CGRect v11;
  CGRect v12;

  v5 = a4;
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v8);

  CGContextSetAllowsAntialiasing(a3, 1);
  CGContextSetShouldAntialias(a3, 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v10, "CGColor"));

  CGContextSetLineWidth(a3, 1.0);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = v7;
  v11.size.height = v9;
  v12 = CGRectInset(v11, 0.5, 0.5);
  CGContextStrokeEllipseInRect(a3, v12);
}

@end
