@implementation SBIconModelMemoryStore(SBIconModelITunesRepresentation)

- (id)initWithITunesRepresentation:()SBIconModelITunesRepresentation
{
  void *v2;
  void *v3;
  id v4;

  +[SBIconStateArchiver rootArchiveFromITunesRepresentation:](SBIconStateArchiver, "rootArchiveFromITunesRepresentation:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconStateArchiver modernizeRootArchive:](SBIconStateArchiver, "modernizeRootArchive:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    a1 = (id)objc_msgSend(a1, "initWithCurrentState:desiredState:", v3, 0);
    v4 = a1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
