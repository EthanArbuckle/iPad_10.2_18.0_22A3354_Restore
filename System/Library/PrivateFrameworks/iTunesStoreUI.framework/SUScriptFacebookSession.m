@implementation SUScriptFacebookSession

- (SUScriptFacebookSession)initWithAppleAccount:(id)a3
{
  SUScriptFacebookSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptFacebookSession;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_account = (SUScriptAppleAccount *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookSession;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 completionFunction:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  ACAccount *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = (void *)MEMORY[0x24BDFA950];
LABEL_12:
    objc_msgSend(v13, "throwException:", CFSTR("Invalid argument"));
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDFA950];
    goto LABEL_12;
  }
  v9 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  if (self->_account)
  {
    v11 = (void *)ISWeakLinkedClassForString();
    v12 = -[SUScriptAppleAccount nativeAccount](self->_account, "nativeAccount");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke;
    v17[3] = &unk_24DE7E2C0;
    v17[4] = v9;
    v17[5] = a5;
    objc_msgSend(v11, "fetchLikeStatusForURL:flags:account:completion:", v10, a4, v12, v17);
  }
  else
  {
    v14 = (void *)objc_msgSend((id)ISWeakLinkedClassForString(), "sharedSession");
    v15 = objc_msgSend(a4, "integerValue");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke_2;
    v16[3] = &unk_24DE7E2C0;
    v16[4] = v9;
    v16[5] = a5;
    objc_msgSend(v14, "fetchLikeStatusForURL:flags:completion:", v10, v15, v16);
  }

}

void __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _callTwoArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2, a3);
}

void __74__SUScriptFacebookSession_fetchLikeStatusForURL_flags_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _callTwoArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2, a3);
}

- (void)likeURL:(id)a3 completionFunction:(id)a4
{
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ACAccount *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[6];

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x24BDFA950];
  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
LABEL_6:
    objc_msgSend(v8, "throwException:", CFSTR("Invalid argument"));
    return;
  }
  v9 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  if (self->_account)
  {
    v11 = (void *)ISWeakLinkedClassForString();
    v12 = -[SUScriptAppleAccount nativeAccount](self->_account, "nativeAccount");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke;
    v15[3] = &unk_24DE7CD90;
    v15[4] = v9;
    v15[5] = a4;
    objc_msgSend(v11, "likeURL:account:completion:", v10, v12, v15);
  }
  else
  {
    v13 = (void *)objc_msgSend((id)ISWeakLinkedClassForString(), "sharedSession");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke_2;
    v14[3] = &unk_24DE7CD90;
    v14[4] = v9;
    v14[5] = a4;
    objc_msgSend(v13, "likeURL:completion:", v10, v14);
  }

}

void __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  _callOneArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2);
}

void __54__SUScriptFacebookSession_likeURL_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _callOneArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2);
}

- (void)unlikeURL:(id)a3 completionFunction:(id)a4
{
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ACAccount *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[6];

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x24BDFA950];
  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDFA950];
LABEL_6:
    objc_msgSend(v8, "throwException:", CFSTR("Invalid argument"));
    return;
  }
  v9 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  if (self->_account)
  {
    v11 = (void *)ISWeakLinkedClassForString();
    v12 = -[SUScriptAppleAccount nativeAccount](self->_account, "nativeAccount");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke;
    v15[3] = &unk_24DE7CD90;
    v15[4] = v9;
    v15[5] = a4;
    objc_msgSend(v11, "unlikeURL:account:completion:", v10, v12, v15);
  }
  else
  {
    v13 = (void *)objc_msgSend((id)ISWeakLinkedClassForString(), "sharedSession");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke_2;
    v14[3] = &unk_24DE7CD90;
    v14[4] = v9;
    v14[5] = a4;
    objc_msgSend(v13, "unlikeURL:completion:", v10, v14);
  }

}

void __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  _callOneArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2);
}

void __56__SUScriptFacebookSession_unlikeURL_completionFunction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _callOneArgumentFunction(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "object"), a2);
}

- (id)_className
{
  return CFSTR("iTunesFacebookSession");
}

- (id)hasAccounts
{
  void *v2;
  int v3;
  id *v4;

  v2 = (void *)ISWeakLinkedClassForString();
  v3 = objc_msgSend((id)objc_msgSend(v2, "serviceForServiceType:", SUSLServiceTypeFacebook()), "hasAccounts");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (id *)MEMORY[0x24BDBD268];
  return *v4;
}

- (unint64_t)likeStatusFlagFriendCount
{
  return 4;
}

- (unint64_t)likeStatusFlagFriends
{
  return 8;
}

- (unint64_t)likeStatusFlagGlobalCount
{
  return 2;
}

- (unint64_t)likeStatusFlagMe
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_74, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookSession;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_57, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookSession;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookSession;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_74, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_57 = (uint64_t)sel_fetchLikeStatusForURL_flags_completionFunction_;
    *(_QWORD *)algn_255187138 = CFSTR("fetchLikeStatus");
    qword_255187140 = (uint64_t)sel_likeURL_completionFunction_;
    unk_255187148 = CFSTR("likeURL");
    qword_255187150 = (uint64_t)sel_unlikeURL_completionFunction_;
    unk_255187158 = CFSTR("unlikeURL");
    __KeyMapping_74 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("hasAccounts"), CFSTR("STATUS_FLAG_FRIEND_COUNT"), CFSTR("likeStatusFlagFriendCount"), CFSTR("STATUS_FLAG_FRIENDS"), CFSTR("likeStatusFlagFriends"), CFSTR("STATUS_FLAG_GLOBAL_COUNT"), CFSTR("likeStatusFlagGlobalCount"), CFSTR("STATUS_FLAG_ME"), CFSTR("likeStatusFlagMe"), 0);
  }
}

@end
