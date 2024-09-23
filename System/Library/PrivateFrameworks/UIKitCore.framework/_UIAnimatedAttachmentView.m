@implementation _UIAnimatedAttachmentView

+ (id)cacheKeyForAttachmentData:(id)a3 name:(id)a4
{
  id v4;
  id v5;
  const void *v6;
  CC_LONG v7;
  CC_SHA1_CTX v9;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, sizeof(v9));
  v4 = a3;
  CC_SHA1_Init(&v9);
  v5 = objc_retainAutorelease(v4);
  v6 = (const void *)objc_msgSend(v5, "bytes", *(_OWORD *)&v9.h0, *(_OWORD *)&v9.h4, *(_OWORD *)&v9.data[1], *(_OWORD *)&v9.data[5], *(_OWORD *)&v9.data[9], *(_OWORD *)&v9.data[13]);
  v7 = objc_msgSend(v5, "length");

  CC_SHA1_Update(&v9, v6, v7);
  CC_SHA1_Final(md, &v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cachedObjectWithKey:(id)a3 creationBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (qword_1ECD81C88 != -1)
    dispatch_once(&qword_1ECD81C88, &__block_literal_global_573);
  objc_msgSend((id)qword_1ECD81C80, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v7, &_MergedGlobals_1264, v5, (void *)1);
    objc_msgSend((id)qword_1ECD81C80, "setObject:forKey:", v7, v5);
  }

  return v7;
}

- (_UIAnimatedAttachmentView)initWithAttachment:(id)a3
{
  id v4;
  _UIAnimatedAttachmentView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIAnimatedAttachmentView;
  v5 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(v4, "fileWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regularFileContents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_class();
    objc_msgSend(v4, "fileWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheKeyForAttachmentData:name:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_class();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48___UIAnimatedAttachmentView_initWithAttachment___block_invoke;
    v17[3] = &unk_1E16B4878;
    v18 = v7;
    v13 = v7;
    objc_msgSend(v12, "cachedObjectWithKey:creationBlock:", v11, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v14, CFSTR("UIAnimatedImage"));

  }
  return v5;
}

- (_UIAnimatedAttachmentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIAnimatedAttachmentView *v7;
  _UIAnimatedAttachmentView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[_UIAnimatedAttachmentView initWithAttachment:](self, "initWithAttachment:", 0);
  v8 = v7;
  if (v7)
    -[UIView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (_UIAnimatedAttachmentView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAnimatedAttachmentView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
