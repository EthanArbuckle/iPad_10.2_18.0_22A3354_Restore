@implementation PSTextViewPane

- (BOOL)handlesDoneButton
{
  return 1;
}

- (PSTextViewPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PSTextViewPane *v7;
  uint64_t v8;
  UITextView *textView;
  UITextView *v10;
  void *v11;
  void *v12;
  UITextView *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PSTextViewPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEAB18], "textViewUsingTextLayoutManager:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    textView = v7->_textView;
    v7->_textView = (UITextView *)v8;

    -[UITextView setFrame:](v7->_textView, "setFrame:", x, y, width, height);
    -[UITextView setEditable:](v7->_textView, "setEditable:", 0);
    v10 = v7->_textView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UITextView setOpaque:](v7->_textView, "setOpaque:", 1);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");

    v13 = v7->_textView;
    UISystemFontForSize();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v13, "setFont:", v14);

    -[UITextView setAutoresizingMask:](v7->_textView, "setAutoresizingMask:", 18);
    -[PSTextViewPane addSubview:](v7, "addSubview:", v7->_textView);
  }
  return v7;
}

- (void)setPreferenceSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PSTextViewPane;
  v4 = a3;
  -[PSEditingPane setPreferenceSpecifier:](&v16, sel_setPreferenceSpecifier_, v4);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("file-path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("synced")))
    {
      objc_msgSend(v6, "stringByDeletingPathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathExtension");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("plist")))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("description"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v13;
      }

    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("metriclog")) & 1) != 0
           || objc_msgSend(v6, "hasSuffix:", CFSTR("metriclog.anon")))
    {
      setupAWDConnection();
      createDescriptionForMetriclogFile();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v11);
        v14 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v14;
      }
      teardownAWDConnection();
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("gz")) & 1) != 0)
    {
      v11 = v5;
      v5 = 0;
    }
    else if (objc_msgSend(v8, "hasPrefix:", CFSTR("HealthWrap")))
    {
      PSDescriptionForHealthAnalyticsFileWithName(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v11);
        v15 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithContentsOfFile:usedEncoding:error:", v6, 0, 0);
      v11 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[UITextView setText:](self->_textView, "setText:", v5);
  }

}

- (void)setText:(id)a3
{
  -[UITextView setText:](self->_textView, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
