@implementation THGlossaryLinkResolver

+ (THGlossaryLinkResolver)glossaryLinkResolverWithGlossaryController:(id)a3
{
  return (THGlossaryLinkResolver *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithGlossaryController:", a3);
}

- (THGlossaryLinkResolver)initWithGlossaryController:(id)a3
{
  THGlossaryLinkResolver *v4;
  THGlossaryLinkResolver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THGlossaryLinkResolver;
  v4 = -[THGlossaryLinkResolver init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THGlossaryLinkResolver setGlossaryController:](v4, "setGlossaryController:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  self->mGlossaryController = 0;
  v2.receiver = self;
  v2.super_class = (Class)THGlossaryLinkResolver;
  -[THGlossaryLinkResolver dealloc](&v2, "dealloc");
}

- (id)anchorFromAbsoluteLink:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(a3, "docRelativePath");
  if (v4
    && (v5 = -[THGlossaryController entryForPath:](-[THGlossaryLinkResolver glossaryController](self, "glossaryController"), "entryForPath:", objc_msgSend(CFSTR("/"), "stringByAppendingString:", v4))) != 0)
  {
    return +[THModelGlossaryEntryAnchor glossaryEntryAnchorWithGlossaryEntry:](THModelGlossaryEntryAnchor, "glossaryEntryAnchorWithGlossaryEntry:", v5);
  }
  else
  {
    return 0;
  }
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

@end
