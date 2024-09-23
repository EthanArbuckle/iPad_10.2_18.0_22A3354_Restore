@implementation THModelGlossaryEntryBody

- (THWPStorage)headerInfo
{
  return self->mHeaderInfo;
}

- (void)setHeaderInfo:(id)a3
{
  id v5;

  -[THModelGlossaryEntryBody willModify](self, "willModify");
  v5 = a3;

  self->mHeaderInfo = (THWPStorage *)a3;
}

- (THWPStorage)bodyStorage
{
  return self->mBodyStorage;
}

- (void)setBodyStorage:(id)a3
{
  id v5;

  -[THModelGlossaryEntryBody willModify](self, "willModify");
  v5 = a3;

  self->mBodyStorage = (THWPStorage *)a3;
}

- (NSArray)bodyFloatingInfos
{
  return &self->mBodyFloatingInfos->super;
}

- (THWPStorage)relatedTermsInfo
{
  return self->mRelatedTermsInfo;
}

- (void)setRelatedTermsInfo:(id)a3
{
  id v5;

  -[THModelGlossaryEntryBody willModify](self, "willModify");
  v5 = a3;

  self->mRelatedTermsInfo = (THWPStorage *)a3;
}

- (THWPStorage)linksInfo
{
  return self->mLinksInfo;
}

- (void)setLinksInfo:(id)a3
{
  id v5;

  -[THModelGlossaryEntryBody willModify](self, "willModify");
  v5 = a3;

  self->mLinksInfo = (THWPStorage *)a3;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  id v5;

  -[THModelGlossaryEntryBody willModify](self, "willModify");
  v5 = a3;

  self->mStylesheet = (TSSStylesheet *)a3;
}

- (THModelGlossaryEntryBody)initWithContext:(id)a3
{
  THModelGlossaryEntryBody *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THModelGlossaryEntryBody;
  v3 = -[THModelGlossaryEntryBody initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
    v3->mBodyFloatingInfos = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mHeaderInfo = 0;
  self->mBodyStorage = 0;

  self->mBodyFloatingInfos = 0;
  self->mRelatedTermsInfo = 0;

  self->mLinksInfo = 0;
  self->mStylesheet = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntryBody;
  -[THModelGlossaryEntryBody dealloc](&v3, "dealloc");
}

- (void)addFloatingInfo:(id)a3
{
  -[THModelGlossaryEntryBody willModify](self, "willModify");
  -[NSMutableArray addObject:](self->mBodyFloatingInfos, "addObject:", a3);
}

@end
