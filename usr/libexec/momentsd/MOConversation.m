@implementation MOConversation

- (MOConversation)initWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  MOConversation *v20;
  MOConversation *v21;
  void *v22;
  uint64_t v23;
  NSDate *startDate;
  void *v25;
  uint64_t v26;
  NSDate *endDate;
  id v28;
  MOConversation *v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSString *providerId;
  _QWORD v35[4];
  MOConversation *v36;
  id v37;
  objc_super v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_10;
    goto LABEL_7;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MOConversation initWithContactIdentifier:scoredContact:interactions:].cold.2();

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOConversation.m"), 16, CFSTR("Invalid parameter not satisfying: contactIdentifier != nil (in %s:%d)"), "-[MOConversation initWithContactIdentifier:scoredContact:interactions:]", 16);

  if (!v13)
  {
LABEL_7:
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MOConversation initWithContactIdentifier:scoredContact:interactions:].cold.1();

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOConversation.m"), 17, CFSTR("Invalid parameter not satisfying: interactions != nil (in %s:%d)"), "-[MOConversation initWithContactIdentifier:scoredContact:interactions:]", 17);

  }
LABEL_10:
  v38.receiver = self;
  v38.super_class = (Class)MOConversation;
  v20 = -[MOConversation init](&v38, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contactIdentifier, a3);
    objc_storeStrong((id *)&v21->_scoredContact, a4);
    objc_storeStrong((id *)&v21->_interactions, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
    startDate = v21->_startDate;
    v21->_startDate = (NSDate *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
    endDate = v21->_endDate;
    v21->_endDate = (NSDate *)v26;

    v28 = objc_alloc_init((Class)NSMutableArray);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __71__MOConversation_initWithContactIdentifier_scoredContact_interactions___block_invoke;
    v35[3] = &unk_1002AF918;
    v29 = v21;
    v36 = v29;
    v37 = v28;
    v30 = v28;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsJoinedByString:", CFSTR("|")));
    v32 = objc_claimAutoreleasedReturnValue(-[MOConversation providerIdFromConcatenatedIdentifiers:](v29, "providerIdFromConcatenatedIdentifiers:", v31));
    providerId = v29->_providerId;
    v29->_providerId = (NSString *)v32;

  }
  return v21;
}

void __71__MOConversation_initWithContactIdentifier_scoredContact_interactions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "earlierDate:", v4));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laterDate:", v9));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      objc_msgSend(v17, "addObject:", v18);

    }
  }

}

+ (id)conversationWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithContactIdentifier:scoredContact:interactions:", v10, v9, v8);

  return v11;
}

- (id)providerIdFromConcatenatedIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 2));
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v6)
  {
    v8 = v7;
    if (objc_msgSend(v5, "length"))
    {
      v12[0] = _PASMurmur3_x86_128(v6, v8, 1765656435);
      v12[1] = v9;
      v10 = _PASBytesToHex(v12, 16);
      v6 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_8;
    }
LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (BOOL)isEqualToConversation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *contactIdentifier;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  int v14;
  PPScoredContact *scoredContact;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  int v20;
  NSArray *interactions;
  void *v22;
  unsigned __int8 v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_contactIdentifier != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
    v11 = -[NSString isEqual:](contactIdentifier, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_scoredContact != 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scoredContact"));
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  scoredContact = self->_scoredContact;
  if (scoredContact)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scoredContact"));
    v17 = -[PPScoredContact isEqual:](scoredContact, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_interactions != 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactions"));
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    interactions = self->_interactions;
    if (interactions)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactions"));
      v23 = -[NSArray isEqual:](interactions, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  MOConversation *v4;
  uint64_t v5;
  MOConversation *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MOConversation *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = -[MOConversation isEqualToConversation:](self, "isEqualToConversation:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char *v4;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = (char *)-[PPScoredContact hash](self->_scoredContact, "hash") + 32 * v3 - v3;
  return (_BYTE *)-[NSArray hash](self->_interactions, "hash") - v4 + 32 * (_QWORD)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOConversation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MOConversation *v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  objc_class *v35;
  NSString *v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  id v41;
  NSErrorUserInfoKey v42;
  id v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  NSErrorUserInfoKey v46;
  id v47;
  NSErrorUserInfoKey v48;
  const __CFString *v49;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("contactIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v9 = objc_opt_class(NSString, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PPScoredContact, v10), CFSTR("scoredContact"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (!v12)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v32)
        {
          v22 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v13 = objc_alloc((Class)NSSet);
      v15 = objc_opt_class(NSArray, v14);
      v17 = objc_msgSend(v13, "initWithObjects:", v15, objc_opt_class(MOInteraction, v16), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("interactions")));

      if (!v18)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v33)
          goto LABEL_16;
        v44 = NSLocalizedDescriptionKey;
        v45 = CFSTR("Retrieved nil serialized value for nonnull MOConversation.interactions");
        v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
        v30 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOConversationOCNTErrorDomain"), 2, v29);
        objc_msgSend(v4, "failWithError:", v30);
        goto LABEL_11;
      }
      v20 = objc_opt_class(NSArray, v19);
      if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
      {
        self = -[MOConversation initWithContactIdentifier:scoredContact:interactions:](self, "initWithContactIdentifier:scoredContact:interactions:", v8, v12, v18);
        v22 = self;
LABEL_17:

        goto LABEL_18;
      }
      v35 = (objc_class *)objc_opt_class(NSArray, v21);
      v36 = NSStringFromClass(v35);
      v29 = (id)objc_claimAutoreleasedReturnValue(v36);
      v38 = (objc_class *)objc_opt_class(v18, v37);
      v39 = NSStringFromClass(v38);
      v30 = (id)objc_claimAutoreleasedReturnValue(v39);
      v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOConversation key \"interactions\" (expected %@, decoded %@)"), v29, v30, 0);
      v42 = NSLocalizedDescriptionKey;
      v43 = v31;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v41 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOConversationOCNTErrorDomain"), 3, v40);
      objc_msgSend(v4, "failWithError:", v41);

    }
    else
    {
      v24 = (objc_class *)objc_opt_class(NSString, v10);
      v25 = NSStringFromClass(v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (objc_class *)objc_opt_class(v8, v26);
      v28 = NSStringFromClass(v27);
      v18 = (id)objc_claimAutoreleasedReturnValue(v28);
      v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOConversation key \"contactIdentifier\" (expected %@, decoded %@)"), v12, v18, 0);
      v46 = NSLocalizedDescriptionKey;
      v47 = v29;
      v30 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      v31 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOConversationOCNTErrorDomain"), 3, v30);
      objc_msgSend(v4, "failWithError:", v31);
    }

LABEL_11:
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (!v23)
  {
    v48 = NSLocalizedDescriptionKey;
    v49 = CFSTR("Retrieved nil serialized value for nonnull MOConversation.contactIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOConversationOCNTErrorDomain"), 2, v12);
    objc_msgSend(v4, "failWithError:", v18);
    goto LABEL_16;
  }
  v22 = 0;
LABEL_19:

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *contactIdentifier;
  PPScoredContact *scoredContact;
  NSArray *interactions;
  id v8;

  v4 = a3;
  contactIdentifier = self->_contactIdentifier;
  v8 = v4;
  if (contactIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
    v4 = v8;
  }
  scoredContact = self->_scoredContact;
  if (scoredContact)
  {
    objc_msgSend(v8, "encodeObject:forKey:", scoredContact, CFSTR("scoredContact"));
    v4 = v8;
  }
  interactions = self->_interactions;
  if (interactions)
  {
    objc_msgSend(v8, "encodeObject:forKey:", interactions, CFSTR("interactions"));
    v4 = v8;
  }

}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("<MOConversation | contactIdentifier:%@ scoredContact:%@ interactions:%@>"), self->_contactIdentifier, self->_scoredContact, self->_interactions);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (PPScoredContact)scoredContact
{
  return self->_scoredContact;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_scoredContact, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithContactIdentifier:scoredContact:interactions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: interactions != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)initWithContactIdentifier:scoredContact:interactions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: contactIdentifier != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
