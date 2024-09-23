@implementation WBSTopHitCompletionMatch

- (WBSTopHitCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5 shouldPreload:(BOOL)a6
{
  WBSTopHitCompletionMatch *v7;
  WBSTopHitCompletionMatch *v8;
  WBSTopHitCompletionMatch *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSTopHitCompletionMatch;
  v7 = -[WBSBookmarkAndHistoryCompletionMatch initWithBookmarkAndHistoryCompletionMatch:userInput:forQueryID:](&v11, sel_initWithBookmarkAndHistoryCompletionMatch_userInput_forQueryID_, a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_shouldPreload = a6;
    v9 = v7;
  }

  return v8;
}

- (BOOL)isTopHit
{
  return 1;
}

- (id)parsecDomainIdentifier
{
  return CFSTR("tophit");
}

- (BOOL)shouldPreload
{
  return self->_shouldPreload;
}

@end
