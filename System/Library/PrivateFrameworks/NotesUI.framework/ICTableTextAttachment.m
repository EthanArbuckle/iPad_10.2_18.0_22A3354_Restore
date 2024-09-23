@implementation ICTableTextAttachment

- (id)image
{
  return 0;
}

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  objc_super v26;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v26.receiver = self;
  v26.super_class = (Class)ICTableTextAttachment;
  -[ICTextAttachment attachmentBoundsMargins](&v26, sel_attachmentBoundsMargins);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "preferredViewSize");

    if (!v12)
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "note");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      if (objc_msgSend(v15, "length"))
      {
        v16 = *MEMORY[0x1E0DC10F8];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __48__ICTableTextAttachment_attachmentBoundsMargins__block_invoke;
        v21[3] = &unk_1E5C1F360;
        v21[4] = self;
        v21[5] = &v22;
        objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, 1, 0, v21);
      }
      if (*((_BYTE *)v23 + 24))
        v8 = 10.0;
      _Block_object_dispose(&v22, 8);

    }
  }
  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

uint64_t __48__ICTableTextAttachment_attachmentBoundsMargins__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (*(_QWORD *)(result + 32) == a2 && a3 == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v11 = (void *)MEMORY[0x1E0D63CD0];
  v12 = a3;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedProviderForAttachment:", v13);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "table");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a5)
      goto LABEL_7;
  }
  else
  {
    objc_opt_class();
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attachmentModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "table");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
LABEL_7:
      objc_msgSend(v14, "joinedAttributedStringForColumns:rows:", 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  if (v6)
    goto LABEL_7;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithNSTextTablesForColumns:rows:context:", 0, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", location, length, v20);
  objc_msgSend(v12, "fixAttributesInRange:", location, objc_msgSend(v20, "length"));

}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0D63CD0];
  -[ICAbstractTextAttachment attachment](self, "attachment", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedProviderForAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedStringWithNSTextTablesForColumns:rows:context:forPrinting:", 0, 0, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)lastAvailableWidth
{
  return self->_lastAvailableWidth;
}

- (void)setLastAvailableWidth:(double)a3
{
  self->_lastAvailableWidth = a3;
}

- (CGSize)lastAttachmentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastAttachmentSize.width;
  height = self->_lastAttachmentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastAttachmentSize:(CGSize)a3
{
  self->_lastAttachmentSize = a3;
}

@end
