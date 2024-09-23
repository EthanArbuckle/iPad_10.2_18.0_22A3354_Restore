@implementation MOInteraction

+ (int64_t)convertMechanism:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x15)
    return 0;
  else
    return a3;
}

+ (int64_t)convertDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

- (MOInteraction)initWithCDInteraction:(id)a3 meIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  MOContact *v14;
  id os_log;
  NSObject *v16;
  MOContact *v17;
  MOInteraction *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  MOContact *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  MOContact *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  int64_t v38;
  void *v39;
  MOContact *v40;
  MOInteraction *v41;
  NSMutableArray *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));

  if (v9)
  {
    if (objc_msgSend(v7, "direction") != (id)1)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personId"));
        if (objc_msgSend(v8, "containsObject:", v13))
        {

          v14 = 0;
LABEL_12:

          goto LABEL_13;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v21 = objc_msgSend(v8, "containsObject:", v20);

        if ((v21 & 1) == 0)
        {
          v22 = [MOContact alloc];
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sender"));
          v14 = -[MOContact initWithCDContact:](v22, "initWithCDContact:", v11);
          goto LABEL_12;
        }
      }
    }
    v14 = 0;
LABEL_13:
    v40 = v14;
    v41 = self;
    v42 = objc_opt_new(NSMutableArray);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recipients"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (!v24)
      goto LABEL_26;
    v25 = v24;
    v26 = *(_QWORD *)v44;
    while (1)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        if (v28)
        {
          v29 = (MOContact *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1)
                                                                                  + 8 * (_QWORD)i), "personId"));
          if ((objc_msgSend(v8, "containsObject:", v29) & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
            v31 = objc_msgSend(v8, "containsObject:", v30);

            if ((v31 & 1) != 0)
              continue;
            v29 = -[MOContact initWithCDContact:]([MOContact alloc], "initWithCDContact:", v28);
            if (v29)
              -[NSMutableArray addObject:](v42, "addObject:", v29);
          }

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (!v25)
      {
LABEL_26:

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
        v38 = +[MOInteraction convertMechanism:](MOInteraction, "convertMechanism:", objc_msgSend(v7, "mechanism"));
        v34 = +[MOInteraction convertDirection:](MOInteraction, "convertDirection:", objc_msgSend(v7, "direction"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleId"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
        self = -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:](v41, "initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:", v32, v33, v39, v38, v34, v35, v36, v40, v42);

        v17 = v40;
        v18 = self;
        goto LABEL_27;
      }
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[MOInteraction(_CDInteraction) initWithCDInteraction:meIdentifier:].cold.1(v16);

  v17 = (MOContact *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  -[MOContact handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOInteraction+_CDInteraction.m"), 84, CFSTR("Invalid parameter not satisfying: cdInteraction.uuid"));
  v18 = 0;
LABEL_27:

  return v18;
}

- (MOInteraction)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 bundleId:(id)a8 groupName:(id)a9 sender:(id)a10 recipients:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id os_log;
  NSObject *v27;
  MOInteraction *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  MOInteraction *v41;
  MOInteraction *v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  id v50;
  id v53;
  void *v54;
  id v55;
  objc_super v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v16 = a3;
  v49 = a4;
  v17 = a4;
  v50 = a5;
  v18 = a5;
  v53 = a8;
  v19 = a8;
  v55 = a9;
  v20 = a10;
  v21 = a11;
  v54 = v21;
  if (v16)
  {
    v22 = v21;
    v47 = v16;
    v23 = objc_alloc_init((Class)NSMutableArray);
    if (v20)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "personId"));

      if (v24)
      {
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "personId"));
LABEL_10:
        v30 = (void *)v25;
        objc_msgSend(v23, "addObject:", v25);

        goto LABEL_11;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));

      if (v29)
      {
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
        goto LABEL_10;
      }
    }
LABEL_11:
    v44 = v19;
    v45 = v18;
    v46 = v17;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v31 = v22;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (!v32)
      goto LABEL_23;
    v33 = v32;
    v34 = *(_QWORD *)v58;
    while (1)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "personId"));

        if (v37)
        {
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "personId"));
        }
        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));

          if (!v39)
            continue;
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
        }
        v40 = (void *)v38;
        objc_msgSend(v23, "addObject:", v38);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (!v33)
      {
LABEL_23:

        v56.receiver = self;
        v56.super_class = (Class)MOInteraction;
        v41 = -[MOGenericInteraction initWithParticipants:](&v56, "initWithParticipants:", v23);
        v42 = v41;
        v16 = v47;
        v19 = v44;
        if (v41)
        {
          objc_storeStrong((id *)&v41->_identifier, a3);
          objc_storeStrong((id *)&v42->_startDate, v49);
          objc_storeStrong((id *)&v42->_endDate, v50);
          v42->_mechanism = a6;
          v42->_direction = a7;
          objc_storeStrong((id *)&v42->_bundleId, v53);
          objc_storeStrong((id *)&v42->_groupName, a9);
          objc_storeStrong((id *)&v42->_sender, a10);
          objc_storeStrong((id *)&v42->_recipients, a11);
        }
        self = v42;
        v28 = self;
        v18 = v45;
        v17 = v46;
        goto LABEL_26;
      }
    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:].cold.1(v27);

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOInteraction.m"), 34, CFSTR("Invalid parameter not satisfying: identifier"));
  v28 = 0;
LABEL_26:

  return v28;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction sender](self, "sender"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  v4 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction recipients](self, "recipients"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9), "description"));
        if (v10)
          -[NSMutableArray addObject:](v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(";")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction identifier](self, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction startDate](self, "startDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction endDate](self, "endDate"));
  v15 = -[MOInteraction mechanism](self, "mechanism");
  v16 = -[MOInteraction direction](self, "direction");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction bundleId](self, "bundleId"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOInteraction groupName](self, "groupName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier, %@, startDate, %@, endDate, %@, mechanism, %lu, direction, %lu, bundleId, %@, group name, %@, sender, <%@>, receipts, <%@>"), v12, v13, v14, v15, v16, v17, v18, v21, v11));

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mechanism, CFSTR("mechanism"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));

}

- (MOInteraction)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  void *v27;
  MOInteraction *v28;
  id v30;
  void *v31;

  v3 = a3;
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), CFSTR("identifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v6), CFSTR("startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v9), CFSTR("endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v30 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mechanism"));
  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("direction"));
  v14 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v13), CFSTR("bundleId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v17 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v16), CFSTR("groupName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v20 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(MOContact, v19), CFSTR("sender"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v23 = objc_opt_class(NSArray, v22);
  v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(MOContact, v24), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("recipients")));

  v28 = -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:](self, "initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:", v31, v8, v11, v30, v12, v15, v18, v21, v27);
  return v28;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (int64_t)direction
{
  return self->_direction;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (MOContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v1, 2u);
}

@end
