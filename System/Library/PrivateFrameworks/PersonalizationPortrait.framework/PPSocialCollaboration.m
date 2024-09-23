@implementation PPSocialCollaboration

- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16
{
  return -[PPSocialCollaboration initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:collaborationIdentifier:contentDisplayName:contentCreationDate:contentUTIType:fileProviderId:earliestAttributionIdentifiers:localIdentity:localIdentityProof:handleToIdentityMap:score:](self, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:collaborationIdentifier:contentDisplayName:contentCreationDate:contentUTIType:fileProviderId:earliestAttributionIdentifiers:localIdentity:localIdentityProof:handleToIdentityMap:score:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0);
}

- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16 score:(id)a17
{
  id v18;
  NSString *v19;
  NSDate *v20;
  NSString *v21;
  NSString *v22;
  NSDictionary *v23;
  NSData *v24;
  NSData *v25;
  PPSocialCollaboration *v26;
  NSString *contentDisplayName;
  NSString *v28;
  NSDate *creationDate;
  NSDate *v30;
  NSString *contentType;
  NSString *v32;
  NSString *fileProviderId;
  NSString *v34;
  NSDictionary *earliestAttributionIdentifiers;
  NSDictionary *v36;
  NSData *localIdentity;
  NSData *v38;
  NSData *localIdentityProof;
  NSData *v40;
  NSData *handleToIdentityMap;
  NSData *v48;
  id v49;
  void *v51;
  objc_super v52;

  v18 = a3;
  v49 = a8;
  v19 = (NSString *)a9;
  v20 = (NSDate *)a10;
  v21 = (NSString *)a11;
  v22 = (NSString *)a12;
  v23 = (NSDictionary *)a13;
  v24 = (NSData *)a14;
  v25 = (NSData *)a15;
  v48 = (NSData *)a16;
  v52.receiver = self;
  v52.super_class = (Class)PPSocialCollaboration;
  v51 = v18;
  v26 = -[PPSocialHighlight initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:](&v52, sel_initWithIdentifier_resourceURL_timestamp_attributionIdentifiers_supplementaryData_score_, v18, a4, a5, a6, a7, a17);
  objc_storeStrong((id *)&v26->_collaborationIdentifier, a8);
  if (!v26->_collaborationIdentifier)
    objc_storeStrong((id *)&v26->_collaborationIdentifier, a3);
  contentDisplayName = v26->_contentDisplayName;
  v26->_contentDisplayName = v19;
  v28 = v19;

  creationDate = v26->_creationDate;
  v26->_creationDate = v20;
  v30 = v20;

  contentType = v26->_contentType;
  v26->_contentType = v21;
  v32 = v21;

  fileProviderId = v26->_fileProviderId;
  v26->_fileProviderId = v22;
  v34 = v22;

  earliestAttributionIdentifiers = v26->_earliestAttributionIdentifiers;
  v26->_earliestAttributionIdentifiers = v23;
  v36 = v23;

  localIdentity = v26->_localIdentity;
  v26->_localIdentity = v24;
  v38 = v24;

  localIdentityProof = v26->_localIdentityProof;
  v26->_localIdentityProof = v25;
  v40 = v25;

  handleToIdentityMap = v26->_handleToIdentityMap;
  v26->_handleToIdentityMap = v48;

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSocialHighlight identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight resourceURL](self, "resourceURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight attributionIdentifiers](self, "attributionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight supplementaryData](self, "supplementaryData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight score](self, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration collaborationIdentifier](self, "collaborationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration contentDisplayName](self, "contentDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration contentType](self, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration fileProviderId](self, "fileProviderId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialCollaboration earliestAttributionIdentifiers](self, "earliestAttributionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("<PPSocialCollaboration id:'%@' ru:'%@' ts:'%@' at:'%@' sd:'%@' sc:'%@' cid:'%@' cdn:'%@' cd:'%@' ct:'%@' fpid: '%@' eaid:'%@'>"), v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSocialCollaboration;
  v4 = a3;
  -[PPSocialHighlight encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_collaborationIdentifier, CFSTR("cid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentDisplayName, CFSTR("cdn"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("cd"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentType, CFSTR("ct"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileProviderId, CFSTR("fpid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_earliestAttributionIdentifiers, CFSTR("eaid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localIdentity, CFSTR("locid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localIdentityProof, CFSTR("locidp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_handleToIdentityMap, CFSTR("hidmap"));

}

- (PPSocialCollaboration)initWithCoder:(id)a3
{
  id v4;
  PPSocialCollaboration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  PPSocialCollaboration *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PPSocialCollaboration *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PPSocialCollaboration;
  v5 = -[PPSocialHighlight initWithCoder:](&v54, sel_initWithCoder_, v4);
  v6 = (void *)MEMORY[0x1E0D81610];
  v7 = objc_opt_class();
  pp_social_highlights_log_handle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("cid"), v4, 1, CFSTR("PPErrorDomain"), 23, v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  pp_social_highlights_log_handle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("cdn"), v4, 1, CFSTR("PPErrorDomain"), 23, v11);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D81610];
  v13 = objc_opt_class();
  pp_social_highlights_log_handle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v13, CFSTR("cd"), v4, 1, CFSTR("PPErrorDomain"), 23, v14);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D81610];
  v16 = objc_opt_class();
  pp_social_highlights_log_handle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("ct"), v4, 1, CFSTR("PPErrorDomain"), 23, v17);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D81610];
  v19 = objc_opt_class();
  pp_social_highlights_log_handle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("fpid"), v4, 0, CFSTR("PPErrorDomain"), 23, v20);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D81610];
  v22 = (void *)MEMORY[0x18D7805AC]();
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  v24 = objc_opt_class();
  v25 = (void *)objc_msgSend(v23, "initWithObjects:", v24, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v22);
  pp_social_highlights_log_handle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("eaid"), v4, 0, CFSTR("PPErrorDomain"), 23, v26);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D81610];
  v28 = objc_opt_class();
  pp_social_highlights_log_handle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v28, CFSTR("locid"), v4, 0, CFSTR("PPErrorDomain"), 23, v29);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D81610];
  v31 = objc_opt_class();
  pp_social_highlights_log_handle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v31, CFSTR("locidp"), v4, 0, CFSTR("PPErrorDomain"), 23, v32);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D81610];
  v34 = objc_opt_class();
  pp_social_highlights_log_handle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v34, CFSTR("hidmap"), v4, 0, CFSTR("PPErrorDomain"), 23, v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v5;
  -[PPSocialHighlight identifier](v5, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight resourceURL](v5, "resourceURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight timestamp](v5, "timestamp");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight attributionIdentifiers](v5, "attributionIdentifiers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight supplementaryData](v36, "supplementaryData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight score](v36, "score");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PPSocialCollaboration initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:collaborationIdentifier:contentDisplayName:contentCreationDate:contentUTIType:fileProviderId:earliestAttributionIdentifiers:localIdentity:localIdentityProof:handleToIdentityMap:score:](v36, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:collaborationIdentifier:contentDisplayName:contentCreationDate:contentUTIType:fileProviderId:earliestAttributionIdentifiers:localIdentity:localIdentityProof:handleToIdentityMap:score:", v43, v37, v38, v39, v40, v51, v53, v52, v50, v49, v48, v46, v45, v44, v41);

  return v47;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  return self->_earliestAttributionIdentifiers;
}

- (NSString)contentDisplayName
{
  return self->_contentDisplayName;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (NSData)proofOfInclusionHashes
{
  return self->_proofOfInclusionHashes;
}

- (NSData)proofOfInclusionLocalKeyHash
{
  return self->_proofOfInclusionLocalKeyHash;
}

- (NSData)localIdentity
{
  return self->_localIdentity;
}

- (NSData)localIdentityProof
{
  return self->_localIdentityProof;
}

- (NSData)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_localIdentityProof, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_proofOfInclusionLocalKeyHash, 0);
  objc_storeStrong((id *)&self->_proofOfInclusionHashes, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentDisplayName, 0);
  objc_storeStrong((id *)&self->_earliestAttributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
