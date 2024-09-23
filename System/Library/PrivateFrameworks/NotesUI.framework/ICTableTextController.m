@implementation ICTableTextController

- (ICTableTextController)init
{
  ICTableTextController *v2;
  ICTableTextController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTableTextController;
  v2 = -[ICTextController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICTextController setIsAutoListInsertionDisabled:](v2, "setIsAutoListInsertionDisabled:", 1);
  return v3;
}

- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if (length)
    goto LABEL_5;
  if (location != objc_msgSend(v9, "length"))
    goto LABEL_5;
  objc_opt_class();
  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v11 = (id)objc_msgSend(v10, "rowAtIndex:rowRange:", location, &v14);
  v12 = v15;

  if (v12)
  {
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)ICTableTextController;
    -[ICTTTextController styleText:inRange:fixModelAttributes:](&v13, sel_styleText_inRange_fixModelAttributes_, v9, location, length, v5);
  }

}

- (id)defaultTypingAttributesForEmptyDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICTTTextController bodyAttributes](self, "bodyAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0D63928]);
  -[ICTTTextController zoomController](self, "zoomController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomFontInAttributes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

@end
