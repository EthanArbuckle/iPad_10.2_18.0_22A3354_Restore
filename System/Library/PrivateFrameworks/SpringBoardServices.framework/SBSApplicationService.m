@implementation SBSApplicationService

- (void)deleteSnapshotsForApplicationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractApplicationService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSnapshotsForApplicationIdentifier:", v4);

}

@end
