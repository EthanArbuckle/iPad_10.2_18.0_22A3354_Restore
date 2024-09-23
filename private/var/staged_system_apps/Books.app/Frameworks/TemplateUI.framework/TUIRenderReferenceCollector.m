@implementation TUIRenderReferenceCollector

+ (id)referenceCollectorWithViewState:(id)a3
{
  id v3;
  _TUIRenderReferenceCollector *v4;

  v3 = a3;
  v4 = -[_TUIRenderReferenceCollector initWithViewState:]([_TUIRenderReferenceCollector alloc], "initWithViewState:", v3);

  return v4;
}

@end
