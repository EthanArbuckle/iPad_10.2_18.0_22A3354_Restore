@implementation UIShareInvitationRemoteViewController

void __74___UIShareInvitationRemoteViewController__dismissAndRepresentForActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_representFullscreenAfterActivityDismissal:", *(_QWORD *)(a1 + 40));

}

@end
