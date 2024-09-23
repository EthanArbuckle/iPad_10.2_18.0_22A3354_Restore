@implementation _UIValidatableCommand

- (SEL)action
{
  SEL result;

  result = (SEL)self->_alternate;
  if (result)
    return (SEL)objc_msgSend((id)result, "action");
  result = (SEL)self->_command;
  if (result)
    return (SEL)objc_msgSend((id)result, "action");
  return result;
}

- (id)propertyList
{
  return -[UICommand propertyList](self->_command, "propertyList");
}

- (id)alternates
{
  return -[UICommand alternates](self->_command, "alternates");
}

- (_UIValidatableCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIValidatableCommand;
  return -[UICommand initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:](&v3, sel_initWithTitle_image_imageName_action_propertyList_alternates_discoverabilityTitle_attributes_state_, &stru_1E16EDF20, 0, 0, sel__nop_, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);
}

- (void)useCommand:(id)a3 alternate:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_command, a3);
  objc_storeStrong((id *)&self->_alternate, a4);
  if (v7)
    v8 = v7;
  else
    v8 = v13;
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICommand setTitle:](self, "setTitle:", v9);

  objc_msgSend(v13, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICommand setImage:](self, "setImage:", v10);

  objc_msgSend(v13, "selectedImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICommand setSelectedImage:](self, "setSelectedImage:", v11);

  objc_msgSend(v13, "discoverabilityTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICommand setDiscoverabilityTitle:](self, "setDiscoverabilityTitle:", v12);

  -[UICommand setAttributes:](self, "setAttributes:", objc_msgSend(v13, "attributes"));
  -[UICommand setState:](self, "setState:", objc_msgSend(v13, "state"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternate, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
