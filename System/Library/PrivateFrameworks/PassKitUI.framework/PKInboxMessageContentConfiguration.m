@implementation PKInboxMessageContentConfiguration

+ (id)configurationWithInboxMessage:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(a1, "subtitleCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyMember");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountUserInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invitationDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D66C60];
  objc_msgSend(v8, "originatorNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactForFamilyMember:nameComponents:imageData:", v6, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pkFullName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("INVITATION_FROM_FORMAT"), CFSTR("%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PKUIImageNamed(CFSTR("Hero_Apply-CCS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v14);

  PKLocalizedMadisonString(CFSTR("INVITATION_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v15);

  objc_msgSend(v5, "setSecondaryText:", v13);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v5, "imageProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaximumSize:", 1.79769313e308, 40.0);
  objc_msgSend(v17, "setCornerRadius:", 3.0);
  objc_msgSend(v5, "secondaryTextProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setColor:", v19);

  objc_msgSend(v18, "setFont:", v16);
  return v5;
}

@end
