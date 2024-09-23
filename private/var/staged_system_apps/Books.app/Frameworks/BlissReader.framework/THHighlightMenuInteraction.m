@implementation THHighlightMenuInteraction

- (THHighlightMenuInteraction)initWithAnnotationUUID:(id)a3 delegate:(id)a4
{
  THHighlightMenuInteraction *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THHighlightMenuInteraction;
  result = -[THHighlightMenuInteraction initWithDelegate:](&v6, "initWithDelegate:", a4);
  result->_annotationUUID = (NSString *)a3;
  return result;
}

- (NSString)annotationUUID
{
  return self->_annotationUUID;
}

- (void)setAnnotationUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
