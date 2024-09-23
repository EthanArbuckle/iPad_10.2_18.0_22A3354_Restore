@implementation RadioMutableTrackHistorySectionInfo

- (void)setIndexTitle:(id)a3
{
  NSString *v4;
  NSString *indexTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  indexTitle = self->super._indexTitle;
  self->super._indexTitle = v4;

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->super._name;
  self->super._name = v4;

}

- (void)setNumberOfObjects:(unint64_t)a3
{
  self->super._numberOfObjects = a3;
}

- (void)setObjects:(id)a3
{
  NSArray *v4;
  NSArray *objects;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  objects = self->super._objects;
  self->super._objects = v4;

}

@end
