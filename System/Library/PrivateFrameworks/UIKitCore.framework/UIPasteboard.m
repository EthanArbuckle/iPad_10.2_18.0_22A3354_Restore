@implementation UIPasteboard

+ (UIPasteboard)generalPasteboard
{
  return (UIPasteboard *)+[_UIConcretePasteboard generalPasteboard](_UIConcretePasteboard, "generalPasteboard");
}

+ (UISPasteSharingToken)pasteSharingTokenFromOpenURL
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1172);
  v2 = (id)qword_1ECD7F548;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1172);
  return (UISPasteSharingToken *)v2;
}

+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5
{
  +[_UIConcretePasteboard _pinItemProviders:forPasteboardNamed:withExpirationDate:](_UIConcretePasteboard, "_pinItemProviders:forPasteboardNamed:withExpirationDate:", a3, a4, a5);
}

+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3
{
  +[_UIConcretePasteboard _clearPinnedItemProvidersForPasteboardNamed:](_UIConcretePasteboard, "_clearPinnedItemProvidersForPasteboardNamed:", a3);
}

+ (void)setPasteSharingTokenFromOpenURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1172);
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)qword_1ECD7F548;
  qword_1ECD7F548 = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1172);
}

- (UIPasteboardName)name
{
  return (UIPasteboardName)CFSTR("Nonfunctioning pasteboard");
}

+ (void)removePasteboardWithName:(UIPasteboardName)pasteboardName
{
  +[_UIConcretePasteboard removePasteboardWithName:](_UIConcretePasteboard, "removePasteboardWithName:", pasteboardName);
}

- (BOOL)isPersistent
{
  return 0;
}

- (NSInteger)changeCount
{
  return 0;
}

- (id)pasteSharingToken
{
  return 0;
}

- (NSArray)pasteboardTypes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes
{
  return 0;
}

- (NSData)dataForPasteboardType:(NSString *)pasteboardType
{
  return 0;
}

- (id)valueForPasteboardType:(NSString *)pasteboardType
{
  return 0;
}

- (NSInteger)numberOfItems
{
  return 0;
}

- (NSArray)pasteboardTypesForItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSIndexSet)itemSetWithPasteboardTypes:(NSArray *)pasteboardTypes
{
  return 0;
}

- (NSArray)valuesForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSArray)dataForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSArray)items
{
  return 0;
}

- (NSString)string
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (UIColor)color
{
  return 0;
}

- (NSArray)strings
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (NSArray)images
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (BOOL)hasStrings
{
  return 0;
}

- (BOOL)hasURLs
{
  return 0;
}

- (BOOL)hasImages
{
  return 0;
}

- (BOOL)hasColors
{
  return 0;
}

+ (void)_attemptAuthenticationWithMessage:(id)a3
{
  +[_UIConcretePasteboard _attemptAuthenticationWithMessage:](_UIConcretePasteboard, "_attemptAuthenticationWithMessage:", a3);
}

+ (id)_pasteboardWithName:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  UIPasteboard *v6;
  UIPasteboard *v7;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.find")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.print")))
  {
    v6 = objc_alloc_init(UIPasteboard);
  }
  else
  {
    +[_UIConcretePasteboard _pasteboardWithName:create:](_UIConcretePasteboard, "_pasteboardWithName:create:", v5, v4);
    v6 = (UIPasteboard *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)_pasteboardWithUniqueName
{
  return +[_UIConcretePasteboard _pasteboardWithUniqueName](_UIConcretePasteboard, "_pasteboardWithUniqueName");
}

- (NSArray)availableTypes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)itemProviders
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canInstantiateObjectsOfClass:(Class)a3
{
  return 0;
}

- (id)_detectedPasteboardTypesForTypes:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (id)_detectedPasteboardTypeStringsForTypes:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (void)_performAsDataOwner:(int64_t)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;

  v5 = (void (**)(_QWORD))a4;
  pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
  v6 = pthread_getspecific(_dataOwnerKey);
  pthread_setspecific(_dataOwnerKey, (const void *)a3);
  v5[2](v5);

  pthread_setspecific(_dataOwnerKey, v6);
}

+ (void)_performAsDataOwnerForAction:(SEL)a3 responder:(id)a4 block:(id)a5
{
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  id v11;

  v11 = a4;
  v7 = (void (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v11, "_dataOwnerForPaste");
LABEL_9:
    +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v9, v7);
    goto LABEL_10;
  }
  if (sel_copy_ == a3 || sel_cut_ == a3)
  {
    v9 = objc_msgSend(v11, "_dataOwnerForCopy");
    goto LABEL_9;
  }
  v7[2](v7);
LABEL_10:

}

- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPasteboard.m"), 325, CFSTR("-_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock: was called on UIPasteboard, when it should be called on _UIConcretePasteboard"));

}

@end
