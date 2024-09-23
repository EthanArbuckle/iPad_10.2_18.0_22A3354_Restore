@implementation PRComplicationDragInteraction

- (PRComplicationDragInteraction)initWithDelegate:(id)a3 complicationDescriptor:(id)a4
{
  id v7;
  PRComplicationDragInteraction *v8;
  PRComplicationDragInteraction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PRComplicationDragInteraction;
  v8 = -[UIDragInteraction initWithDelegate:](&v11, sel_initWithDelegate_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_complicationDescriptor, a4);

  return v9;
}

+ (BOOL)isEnabledByDefault
{
  return 1;
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
}

@end
