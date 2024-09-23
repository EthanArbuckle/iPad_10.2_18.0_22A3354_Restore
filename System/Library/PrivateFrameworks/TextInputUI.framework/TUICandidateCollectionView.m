@implementation TUICandidateCollectionView

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "_authenticationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_attemptAuthenticationWithMessage:", v8);

  v10.receiver = self;
  v10.super_class = (Class)TUICandidateCollectionView;
  -[TUICandidateCollectionView touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v7, v6);

}

@end
