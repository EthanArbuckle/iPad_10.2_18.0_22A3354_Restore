@implementation UITextRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentRange, 0);
}

- (BOOL)_isRanged
{
  return !-[UITextRange isEmpty](self, "isEmpty");
}

- (NSObject)_attachmentRange
{
  return self->_attachmentRange;
}

- (BOOL)isEmpty
{
  return 0;
}

- (UITextPosition)start
{
  return 0;
}

- (UITextPosition)end
{
  return 0;
}

- (void)_setAttachmentRange:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentRange, a3);
}

- (UITextRangeImpl)_isImpl
{
  UITextRange *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (UITextRangeImpl *)v3;
}

- (_NSRange)_asNSRangeRelativeToDocument:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[UITextRange _asNSRangeRelativeToDocument:relativeToCurrentLine:](self, "_asNSRangeRelativeToDocument:relativeToCurrentLine:", a3, 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)_asNSRangeRelativeToDocument:(id)a3 relativeToCurrentLine:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "tokenizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextRange start](self, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v10, 4, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v11;

        v7 = v12;
      }

    }
  }
  -[UITextRange start](self, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "offsetFromPosition:toPosition:", v7, v13);

  -[UITextRange start](self, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRange end](self, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "offsetFromPosition:toPosition:", v15, v16);

  v18 = v14;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

- (id)_asNSTextRange
{
  void *v3;
  char isKindOfClass;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UITextRange start](self, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        goto LABEL_17;
      -[UITextRange start](self, "start");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v14;
    }
    else
    {
      v12 = qword_1EDDAC8A8;
      if (!qword_1EDDAC8A8)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1EDDAC8A8);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v6 = v13;
      -[UITextRange start](self, "start");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v14;
    }

LABEL_17:
LABEL_18:
    v11 = 0;
    return v11;
  }
  -[UITextRange start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = objc_claimAutoreleasedReturnValue();

  -[UITextRange end](self, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_16;
      -[UITextRange end](self, "end");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
    }
    else
    {
      v15 = qword_1EDDAC8B0;
      if (!qword_1EDDAC8B0)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1EDDAC8B0);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v17 = v16;
      -[UITextRange end](self, "end");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
    }

LABEL_16:
    goto LABEL_17;
  }
  -[UITextRange end](self, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D70), "initWithLocation:endLocation:", v6, v10);
  return v11;
}

@end
