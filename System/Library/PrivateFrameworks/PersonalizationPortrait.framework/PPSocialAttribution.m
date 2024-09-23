@implementation PPSocialAttribution

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10
{
  uint64_t v11;

  LOWORD(v11) = 0;
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v11);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11
{
  uint64_t v12;

  LOWORD(v12) = a11;
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v12);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11 fromMe:(BOOL)a12
{
  uint64_t v13;

  LOWORD(v13) = __PAIR16__(a12, a11);
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v13);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 collaborationMetadata:(id)a11 starred:(BOOL)a12 fromMe:(BOOL)a13
{
  uint64_t v14;

  LOWORD(v14) = __PAIR16__(a13, a12);
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, 0, a8, a9, a10, a11, v14);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 groupId:(id)a8 relatedPeople:(id)a9 sender:(id)a10 timestamp:(id)a11 collaborationMetadata:(id)a12 starred:(BOOL)a13 fromMe:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  PPSocialAttribution *v24;
  PPSocialAttribution *v25;
  id obj;
  id v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v28 = a5;
  v34 = a5;
  v29 = a6;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PPSocialAttribution;
  v24 = -[PPSocialAttribution init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_sourceAppDisplayName, obj);
    objc_storeStrong((id *)&v25->_conversationIdentifier, v28);
    objc_storeStrong((id *)&v25->_groupPhotoPath, v29);
    objc_storeStrong((id *)&v25->_groupDisplayName, a7);
    objc_storeStrong((id *)&v25->_groupId, a8);
    objc_storeStrong((id *)&v25->_relatedPeople, a9);
    objc_storeStrong((id *)&v25->_sender, a10);
    objc_storeStrong((id *)&v25->_timestamp, a11);
    objc_storeStrong((id *)&v25->_collaborationMetadata, a12);
    v25->_starred = a13;
    v25->_fromMe = a14;
  }

  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSocialAttribution identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution conversationIdentifier](self, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution groupPhotoPath](self, "groupPhotoPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution groupDisplayName](self, "groupDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution relatedPeople](self, "relatedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialAttribution timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("YES");
  if (-[PPSocialAttribution isStarred](self, "isStarred"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!-[PPSocialAttribution isFromMe](self, "isFromMe"))
    v9 = CFSTR("NO");
  -[PPSocialAttribution groupId](self, "groupId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("<PPSocialAttribution id:'%@' sa:'%@' ci:'%@' gp:'%@' gd:'%@' rp:'%@' se:'%@' ts:'%@' st:'%@' fm:'%@' gid:'%@'>"), v15, v14, v3, v4, v5, v6, v7, v8, v10, v9, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceAppDisplayName, CFSTR("sa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationIdentifier, CFSTR("ci"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupPhotoPath, CFSTR("gp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupDisplayName, CFSTR("gd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relatedPeople, CFSTR("rp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("se"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("ts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collaborationMetadata, CFSTR("cmd"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_starred, CFSTR("st"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromMe, CFSTR("fm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupId, CFSTR("gid"));

}

- (PPSocialAttribution)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  char v43;
  void *v44;
  PPSocialAttribution *v45;
  PPSocialAttribution *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  pp_social_highlights_log_handle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("id"), v3, 1, CFSTR("PPErrorDomain"), 23, v6);
  v52 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  pp_social_highlights_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("sa"), v3, 1, CFSTR("PPErrorDomain"), 23, v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = objc_opt_class();
  pp_social_highlights_log_handle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("ci"), v3, 1, CFSTR("PPErrorDomain"), 23, v12);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  pp_social_highlights_log_handle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("gp"), v3, 0, CFSTR("PPErrorDomain"), 23, v15);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D81610];
  v17 = objc_opt_class();
  pp_social_highlights_log_handle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("gd"), v3, 0, CFSTR("PPErrorDomain"), 23, v18);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D81610];
  v20 = (void *)MEMORY[0x18D7805AC]();
  v21 = objc_alloc(MEMORY[0x1E0C99E60]);
  v22 = objc_opt_class();
  v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v20);
  pp_social_highlights_log_handle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v23, CFSTR("rp"), v3, 1, CFSTR("PPErrorDomain"), 23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D81610];
  v27 = objc_opt_class();
  pp_social_highlights_log_handle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("se"), v3, 1, CFSTR("PPErrorDomain"), 23, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D81610];
  v31 = objc_opt_class();
  pp_social_highlights_log_handle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v31, CFSTR("ts"), v3, 1, CFSTR("PPErrorDomain"), 23, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0D81610];
  v35 = objc_opt_class();
  pp_social_highlights_log_handle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v35, CFSTR("cmd"), v3, 0, CFSTR("PPErrorDomain"), 23, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D81610];
  v39 = objc_opt_class();
  pp_social_highlights_log_handle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v39, CFSTR("gid"), v3, 0, CFSTR("PPErrorDomain"), 23, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("st"));
  v43 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("fm"));
  objc_msgSend(v3, "error");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  if (v44)
  {
    v46 = self;
    v47 = (void *)v52;
  }
  else
  {
    v47 = (void *)v52;
    if (v52 && v56 && v55 && v25 && v29 && v33)
    {
      if (v54 && v53
        || (objc_msgSend(v3, "error"), v48 = (void *)objc_claimAutoreleasedReturnValue(), v48, !v48))
      {
        BYTE1(v50) = v43;
        LOBYTE(v50) = v42;
        v46 = -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v52, v56, v55, v54, v53, v41, v25, v29, v33, v37, v50);
        v45 = v46;
        goto LABEL_15;
      }
      v45 = 0;
    }
    v46 = self;
  }
LABEL_15:

  return v45;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceAppDisplayName
{
  return self->_sourceAppDisplayName;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSArray)relatedPeople
{
  return self->_relatedPeople;
}

- (PPSocialPerson)sender
{
  return self->_sender;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSData)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (BOOL)isStarred
{
  return self->_starred;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_relatedPeople, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
