@implementation SUScriptReview

- (SUScriptReview)init
{
  return -[SUScriptReview initWithReview:](self, "initWithReview:", 0);
}

- (SUScriptReview)initWithReview:(id)a3
{
  SUScriptReview *v4;
  SUUIReviewMetadata *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptReview;
  v4 = -[SUScriptObject init](&v8, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = (SUUIReviewMetadata *)objc_msgSend(a3, "copy");
    }
    else
    {
      v6 = ISUIMobileStoreUIFramework();
      v5 = (SUUIReviewMetadata *)objc_alloc_init((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIReviewMetadata"), v6));
    }
    v4->_review = v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptReview;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)copyReview
{
  void *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)-[SUUIReviewMetadata copy](self->_review, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)removeDraft
{
  return (id)*MEMORY[0x24BDBD268];
}

- (id)restoreFromDraft
{
  return (id)*MEMORY[0x24BDBD268];
}

- (id)saveAsDraft
{
  return (id)*MEMORY[0x24BDBD268];
}

- (NSNumber)adamID
{
  return 0;
}

- (NSString)body
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)(id)-[SUUIReviewMetadata body](self->_review, "body");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesReview");
}

- (id)hasSavedDraft
{
  return (id)*MEMORY[0x24BDBD268];
}

- (NSString)infoURL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSURL absoluteString](self->_infoURL, "absoluteString");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)itemType
{
  return 0;
}

- (NSString)nickname
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)(id)-[SUUIReviewMetadata nickname](self->_review, "nickname");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)nicknameIsConfirmed
{
  return (id)*MEMORY[0x24BDBD268];
}

- (NSNumber)rating
{
  void *v3;
  NSNumber *v4;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIReviewMetadata rating](self->_review, "rating");
  v4 = (NSNumber *)objc_msgSend(v3, "numberWithFloat:");
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (void)setBody:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUUIReviewMetadata setBody:](self->_review, "setBody:", v5);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setInfoURL:(id)a3
{
  id v5;
  char v6;
  char isKindOfClass;
  NSURL *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    v6 = 1;
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        return;
      }
      v6 = 0;
      v5 = a3;
    }
  }
  -[SUScriptObject lock](self, "lock");

  if ((v6 & 1) != 0)
    v8 = 0;
  else
    v8 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
  self->_infoURL = v8;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setNickname:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUUIReviewMetadata setNickname:](self->_review, "setNickname:", v5);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setRating:(id)a3
{
  SUUIReviewMetadata *review;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    review = self->_review;
    objc_msgSend(a3, "floatValue");
    -[SUUIReviewMetadata setRating:](review, "setRating:");
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setTitle:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUUIReviewMetadata setTitle:](self->_review, "setTitle:", v5);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (NSString)title
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)(id)-[SUUIReviewMetadata title](self->_review, "title");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_41, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReview;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_33, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptReview;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptReview;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_41, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_33 = (uint64_t)sel_removeDraft;
    *(_QWORD *)algn_2551869A8 = CFSTR("removeDraft");
    qword_2551869B0 = (uint64_t)sel_restoreFromDraft;
    unk_2551869B8 = CFSTR("restoreFromDraft");
    qword_2551869C0 = (uint64_t)sel_saveAsDraft;
    unk_2551869C8 = CFSTR("saveAsDraft");
    __KeyMapping_41 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("adamID"), CFSTR("body"), CFSTR("body"), CFSTR("hasSavedDraft"), CFSTR("hasSavedDraft"), CFSTR("infoURL"), CFSTR("infoURL"), CFSTR("itemType"), CFSTR("itemType"), CFSTR("nickname"), CFSTR("nickname"), CFSTR("nicknameIsConfirmed"), CFSTR("nicknameIsConfirmed"), CFSTR("rating"), CFSTR("rating"), CFSTR("title"), CFSTR("title"),
                        0);
  }
}

@end
