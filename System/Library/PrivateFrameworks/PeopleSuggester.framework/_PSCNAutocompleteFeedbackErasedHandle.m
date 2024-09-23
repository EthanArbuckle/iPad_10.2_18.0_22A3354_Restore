@implementation _PSCNAutocompleteFeedbackErasedHandle

- (_PSCNAutocompleteFeedbackErasedHandle)initWithContact:(id)a3
{
  id v5;
  _PSCNAutocompleteFeedbackErasedHandle *v6;
  _PSCNAutocompleteFeedbackErasedHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSCNAutocompleteFeedbackErasedHandle;
  v6 = -[_PSCNAutocompleteFeedbackErasedHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contact, a3);

  return v7;
}

- (_PSCNAutocompleteFeedbackErasedHandle)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackErasedHandle *v5;
  uint64_t v6;
  CNContact *contact;
  _PSCNAutocompleteFeedbackErasedHandle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PSCNAutocompleteFeedbackErasedHandle;
  v5 = -[_PSCNAutocompleteFeedbackErasedHandle init](&v10, sel_init);
  if (v5)
  {
    getCNContactClass_0();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
