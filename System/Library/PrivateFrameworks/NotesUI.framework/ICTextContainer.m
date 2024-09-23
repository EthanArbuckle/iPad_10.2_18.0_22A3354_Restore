@implementation ICTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect result;

  v35.receiver = self;
  v35.super_class = (Class)ICTextContainer;
  -[ICTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](&v35, sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_opt_class();
  -[ICTextContainer layoutManager](self, "layoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19 >= a4)
    {
      objc_msgSend(v17, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22 == a4)
      {
        if (!v20)
        {
          v25 = 0;
LABEL_16:

          goto LABEL_17;
        }
        objc_msgSend(v20, "typingAttributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v17, "textStorage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a4, 0);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (void *)v24;

      if (v25 && objc_msgSend(v25, "isList"))
      {
        v26 = objc_msgSend(v25, "layoutWritingDirection");
        if (v26 == -1)
          v26 = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", 0);
        -[ICTextContainer layoutManager](self, "layoutManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "textStorage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICTextController indentForStyle:range:attributedString:textView:](ICTextController, "indentForStyle:range:attributedString:textView:", v25, a4, 0, v28, v20);
        v30 = v29;

        if (v26)
        {
          v13 = v13 - v30;
        }
        else
        {
          v9 = v9 + v30;
          v13 = v13 - v30;
          if (objc_msgSend(v25, "isBlockQuote"))
          {
            v9 = v9 + 16.0;
            v13 = v13 + 16.0;
          }
        }
      }
      goto LABEL_16;
    }
  }
LABEL_17:

  v31 = v9;
  v32 = v11;
  v33 = v13;
  v34 = v15;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (BOOL)isSimpleRectangularTextContainer
{
  void *v3;
  _BOOL4 v4;

  -[ICTextContainer exclusionPaths](self, "exclusionPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") || -[ICTextContainer maximumNumberOfLines](self, "maximumNumberOfLines"))
    LOBYTE(v4) = 0;
  else
    v4 = !-[ICTextContainer inPreviewMode](self, "inPreviewMode");

  return v4;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

@end
