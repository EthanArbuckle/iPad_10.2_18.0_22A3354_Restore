@implementation _PSCNAutocompleteFeedbackTypedHandle

- (_PSCNAutocompleteFeedbackTypedHandle)initWithContact:(id)a3 viaContactPicker:(BOOL)a4
{
  id v7;
  _PSCNAutocompleteFeedbackTypedHandle *v8;
  _PSCNAutocompleteFeedbackTypedHandle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSCNAutocompleteFeedbackTypedHandle;
  v8 = -[_PSCNAutocompleteFeedbackTypedHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contact, a3);
    v9->_viaContactPicker = a4;
  }

  return v9;
}

- (_PSCNAutocompleteFeedbackTypedHandle)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackTypedHandle *v5;
  uint64_t v6;
  CNContact *contact;
  _PSCNAutocompleteFeedbackTypedHandle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PSCNAutocompleteFeedbackTypedHandle;
  v5 = -[_PSCNAutocompleteFeedbackTypedHandle init](&v10, sel_init);
  if (v5)
  {
    getCNContactClass_0();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v5->_viaContactPicker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("viaContactPicker"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_viaContactPicker, CFSTR("viaContactPicker"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)viaContactPicker
{
  return self->_viaContactPicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
