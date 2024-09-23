@implementation UIKeyboardImplProxy

void __43___UIKeyboardImplProxy_processPayloadInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processPayloadInfo:", *(_QWORD *)(a1 + 40));

}

void __57___UIKeyboardImplProxy_pushAutocorrections_requestToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushAutocorrections:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __60___UIKeyboardImplProxy_pushCandidateResultSet_requestToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushCandidateResultSet:requestToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
