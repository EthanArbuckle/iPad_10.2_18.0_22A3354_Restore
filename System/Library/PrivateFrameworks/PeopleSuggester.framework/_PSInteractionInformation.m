@implementation _PSInteractionInformation

- (_PSInteractionInformation)initWithHandle:(id)a3 interactionInformation:(id)a4
{
  id v7;
  id v8;
  _PSInteractionInformation *v9;
  _PSInteractionInformation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSInteractionInformation;
  v9 = -[_PSInteractionInformation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountHandle, a3);
    objc_storeStrong((id *)&v10->_interactionInfo, a4);
  }

  return v10;
}

- (id)handle
{
  return self->_accountHandle;
}

- (id)interactionInformation
{
  return self->_interactionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionInfo, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
}

@end
