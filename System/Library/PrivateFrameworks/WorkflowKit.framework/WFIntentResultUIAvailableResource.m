@implementation WFIntentResultUIAvailableResource

- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3
{
  return -[WFIntentResultUIAvailableResource initWithDefinition:resolvedIntentDescriptor:hasSuccessResponseWithDialog:](self, "initWithDefinition:resolvedIntentDescriptor:hasSuccessResponseWithDialog:", a3, 0, 0);
}

- (WFIntentResultUIAvailableResource)initWithDefinition:(id)a3 resolvedIntentDescriptor:(id)a4 hasSuccessResponseWithDialog:(BOOL)a5
{
  id v9;
  WFIntentResultUIAvailableResource *v10;
  WFIntentResultUIAvailableResource *v11;
  WFIntentResultUIAvailableResource *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFIntentResultUIAvailableResource;
  v10 = -[WFResource initWithDefinition:](&v14, sel_initWithDefinition_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resolvedIntentDescriptor, a4);
    v11->_hasSuccessResponseWithDialog = a5;
    v12 = v11;
  }

  return v11;
}

- (void)refreshAvailability
{
  uint64_t v3;
  void *v4;

  if (-[WFIntentResultUIAvailableResource hasSuccessResponseWithDialog](self, "hasSuccessResponseWithDialog"))
  {
    v3 = 1;
  }
  else
  {
    -[WFIntentResultUIAvailableResource resolvedIntentDescriptor](self, "resolvedIntentDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hasCustomUIExtension");

  }
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", v3, 0);
}

- (INIntentDescriptor)resolvedIntentDescriptor
{
  return self->_resolvedIntentDescriptor;
}

- (BOOL)hasSuccessResponseWithDialog
{
  return self->_hasSuccessResponseWithDialog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIntentDescriptor, 0);
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end
