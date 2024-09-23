@implementation PKAccountInvitationChooseMemberRow

- (PKAccountInvitationChooseMemberRow)initWithFamilyMember:(id)a3 photoImage:(id)a4 eligibility:(BOOL)a5
{
  id v9;
  id v10;
  PKAccountInvitationChooseMemberRow *v11;
  PKAccountInvitationChooseMemberRow *v12;
  NSPersonNameComponentsFormatter *v13;
  NSPersonNameComponentsFormatter *nameFormatter;
  NSNumberFormatter *v15;
  NSNumberFormatter *ageFormatter;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountInvitationChooseMemberRow;
  v11 = -[PKAccountInvitationChooseMemberRow init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a3);
    v12->_eligible = a5;
    objc_storeStrong((id *)&v12->_photoImage, a4);
    v13 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3858]);
    nameFormatter = v12->_nameFormatter;
    v12->_nameFormatter = v13;

    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    ageFormatter = v12->_ageFormatter;
    v12->_ageFormatter = v15;

    -[NSNumberFormatter setNumberStyle:](v12->_ageFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setDecimalSeparator:](v12->_ageFormatter, "setDecimalSeparator:", 0);
    -[NSNumberFormatter setGroupingSeparator:](v12->_ageFormatter, "setGroupingSeparator:", 0);
  }

  return v12;
}

- (id)cellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FamilyMemberCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultContentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationChooseMemberRow _updateConfiguration:](self, "_updateConfiguration:", v6);
  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v5, "setBackgroundConfiguration:", v7);
  if (self->_eligible)
    v9 = 3;
  else
    v9 = 0;
  objc_msgSend(v5, "setSelectionStyle:", v9);
  objc_msgSend(v5, "setAccessoryType:", self->_eligible);
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BB8]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountInvitationChooseMemberRow *v4;
  PKAccountInvitationChooseMemberRow *v5;
  unsigned __int8 *v6;
  BOOL v7;

  v4 = (PKAccountInvitationChooseMemberRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
      v7 = self->_eligible == v6[32];
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_familyMember);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (void)_updateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  NSNumberFormatter *ageFormatter;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[PKFamilyMember firstName](self->_familyMember, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  -[PKFamilyMember lastName](self->_familyMember, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:](self->_nameFormatter, "stringFromPersonNameComponents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v27, "setText:", v7);
  }
  else
  {
    -[PKFamilyMember inviteEmail](self->_familyMember, "inviteEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v27, "setText:", v8);
    }
    else
    {
      -[PKFamilyMember appleID](self->_familyMember, "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v9);

    }
  }
  objc_msgSend(v27, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  if (!self->_eligible)
  {
    objc_msgSend(v27, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v13);

  }
  v14 = -[PKFamilyMember memberType](self->_familyMember, "memberType");
  v15 = -[PKFamilyMember status](self->_familyMember, "status");
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      v16 = CFSTR("FAMILY_MEMBER_PENDING");
      goto LABEL_21;
    }
    if (v15)
    {
LABEL_25:
      v21 = 0;
      goto LABEL_26;
    }
  }
  if (-[PKFamilyMember isOrganizer](self->_familyMember, "isOrganizer"))
  {
    v16 = CFSTR("FAMILY_MEMBER_ORGANIZER");
LABEL_21:
    PKLocalizedMadisonString(&v16->isa);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (-[PKFamilyMember isParent](self->_familyMember, "isParent"))
  {
    v16 = CFSTR("FAMILY_MEMBER_PARENT_GUARDIAN");
    goto LABEL_21;
  }
  if (!v14)
  {
    v16 = CFSTR("FAMILY_MEMBER_ADULT");
    goto LABEL_21;
  }
  v17 = -[PKFamilyMember age](self->_familyMember, "age");
  if (!v17)
  {
    if (v14 == 2)
    {
      v16 = CFSTR("FAMILY_MEMBER_CHILD");
      goto LABEL_21;
    }
    if (v14 == 1)
    {
      v16 = CFSTR("FAMILY_MEMBER_TEEN");
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  ageFormatter = self->_ageFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](ageFormatter, "stringFromNumber:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("FAMILY_MEMBER_AGE_FORMAT"), CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  objc_msgSend(v27, "setSecondaryText:", v21);
  objc_msgSend(v27, "secondaryTextProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setColor:", v23);

  objc_msgSend(v27, "secondaryTextProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v25);

  objc_msgSend(v27, "setImage:", self->_photoImage);
  objc_msgSend(v27, "imageProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMaximumSize:", 50.0, 50.0);

}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_ageFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_photoImage, 0);
}

@end
