@implementation MOAction

- (MOAction)initWithActionMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  MOAction *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "action"));
    v8 = objc_msgSend(v5, "actionType");
    v9 = objc_msgSend(v5, "actionSubType");
    objc_msgSend(v5, "actionNameConfidence");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionMetaData"));
    self = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v6, v7, v8, v9, v12, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
      -[MOAction setSourceEventIdentifier:](self, "setSourceEventIdentifier:", v14);

    }
    if (objc_msgSend(v5, "sourceEventAccessType"))
      -[MOAction setSourceEventAccessType:](self, "setSourceEventAccessType:", objc_msgSend(v5, "sourceEventAccessType"));
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)bundleSourceType
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString **v6;
  int64_t v8;

  v3 = -[MOAction actionType](self, "actionType");
  v4 = 0;
  v5 = v3 - 1;
  v6 = MOEventBundleSourceTypeVisitLocation;
  switch(v5)
  {
    case 0uLL:
      v8 = -[MOAction actionSubtype](self, "actionSubtype");
      if ((unint64_t)(v8 - 4) >= 6)
        v6 = MOEventBundleSourceTypeVisitLocation;
      else
        v6 = off_1002AFAE0[v8 - 4];
      goto LABEL_2;
    case 1uLL:
    case 2uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      goto LABEL_2;
    case 3uLL:
      v6 = &MOEventBundleSourceTypeActivity;
      goto LABEL_2;
    case 4uLL:
      v6 = MOEventBundleSourceTypeContact;
      goto LABEL_2;
    case 5uLL:
      v6 = MOEventBundleSourceTypeMedia;
      goto LABEL_2;
    case 6uLL:
      v6 = MOEventBundleSourceTypePhoto;
      goto LABEL_2;
    case 0xBuLL:
      v6 = MOEventBundleSourceTypeStateOfMind;
LABEL_2:
      v4 = *v6;
      break;
    default:
      return v4;
  }
  return v4;
}

+ (id)actionNameFromLifeEvent:(id)a3
{
  id v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "lifeEventCategory");
  if (v3 == (id)1)
  {
    v4 = &kActionNameShopping;
    return *v4;
  }
  if (v3 == (id)4)
  {
    v4 = &kActionNameFlight;
    return *v4;
  }
  if (v3 == (id)2)
  {
    v4 = &kActionNameDining;
    return *v4;
  }
  return 0;
}

+ (unint64_t)actionTypeFromLifeEvent:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "lifeEventCategory");
  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return qword_10029EF98[(_QWORD)(v3 - 1)];
}

- (MOAction)initWithLifeEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  MOAction *v10;

  v4 = a3;
  if (objc_msgSend(v4, "category") == (id)22)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOAction actionNameFromLifeEvent:](MOAction, "actionNameFromLifeEvent:", v4));
    v6 = +[MOAction actionTypeFromLifeEvent:](MOAction, "actionTypeFromLifeEvent:", v4);
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v10 = 0;
    }
    else
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      objc_msgSend(v4, "confidenceScore");
      self = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v9, v5, v8, 0, 0);

      v10 = self;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MOAction)initWithIdentifier:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  void *v8;
  MOAction *v9;

  v5 = a3;
  if (!v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOAction initWithIdentifier:].cold.1(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAction.m"), 30, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOAction initWithIdentifier:]", 30);

  }
  v9 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v5, CFSTR("action"), 0, 0, 0, -1.0);

  return v9;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4
{
  id v6;
  void *v7;
  MOAction *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v7, v6, a4, 0, 0, -1.0);

  return v8;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5
{
  id v8;
  void *v9;
  MOAction *v10;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v9, v8, a4, a5, 0, -1.0);

  return v10;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionNameConfidence:(double)a6
{
  id v10;
  void *v11;
  MOAction *v12;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v11, v10, a4, a5, 0, a6);

  return v12;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionMetaData:(id)a6
{
  id v10;
  id v11;
  void *v12;
  MOAction *v13;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v12, v11, a4, a5, v10, -1.0);

  return v13;
}

- (MOAction)initWithIdentifier:(id)a3 actionName:(id)a4 actionType:(unint64_t)a5 actionSubtype:(int64_t)a6 actionNameConfidence:(double)a7 actionMetaData:(id)a8
{
  id v14;
  id v15;
  MOAction *v16;
  uint64_t v17;
  NSUUID *identifier;
  objc_super v20;

  v14 = a4;
  v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MOAction;
  v16 = -[MOAction init](&v20, "init");
  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_actionName, a4);
    v16->_actionType = a5;
    v16->_actionSubtype = a6;
    v16->_actionNameConfidence = a7;
    objc_storeStrong((id *)&v16->_actionMetaData, a8);
    v16->_sourceEventAccessType = -[MOAction accessTypeFromActionType:actionSubtype:](v16, "accessTypeFromActionType:actionSubtype:", a5, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction actionName](self, "actionName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  v6 = -[MOAction actionType](self, "actionType");
  v7 = -[MOAction actionSubtype](self, "actionSubtype");
  -[MOAction actionNameConfidence](self, "actionNameConfidence");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOAction identifier, %@, action, %@, type, %lu, subtype, %lu, confidence, %f>"), v3, v5, v6, v7, v8));

  return v9;
}

- (unint64_t)accessTypeFromActionType:(unint64_t)a3 actionSubtype:(int64_t)a4
{
  unint64_t result;

  result = 5;
  switch(a3)
  {
    case 1uLL:
      if (a4 == 6)
        goto LABEL_3;
      if ((unint64_t)(a4 - 3) < 2)
        goto LABEL_6;
      if ((unint64_t)a4 > 9 || ((1 << a4) & 0x302) == 0)
        goto LABEL_10;
      result = 5;
      break;
    case 2uLL:
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      return result;
    case 4uLL:
      result = 1;
      break;
    case 5uLL:
LABEL_6:
      result = 3;
      break;
    case 6uLL:
LABEL_3:
      result = 2;
      break;
    default:
LABEL_10:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOAction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  MOAction *v19;
  uint64_t v20;
  id v21;
  void *v22;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("actionName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("actionType"));
  v12 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("actionSubtype"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("actionNameConfidence"));
  v14 = v13;
  v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v15), CFSTR("actionMetaData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v17));
  v19 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v7, v10, v11, v12, v18, v14);

  if (v19)
  {
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v20), CFSTR("sourceEventIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[MOAction setSourceEventIdentifier:](v19, "setSourceEventIdentifier:", v22);

    -[MOAction setSourceEventAccessType:](v19, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_actionType, CFSTR("actionType"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_actionSubtype, CFSTR("actionSubtype"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actionName, CFSTR("actionName"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("actionNameConfidence"), self->_actionNameConfidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_actionMetaData));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("actionMetaData"));

  objc_msgSend(v6, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOAction *v5;
  uint64_t v6;
  MOAction *v7;
  uint64_t v8;
  MOAction *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOAction *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](self, "identifier"));
        if (v10 || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](v9, "identifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](self, "identifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOAction identifier](v9, "identifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (double)actionNameConfidence
{
  return self->_actionNameConfidence;
}

- (NSDictionary)actionMetaData
{
  return self->_actionMetaData;
}

- (void)setActionMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_actionMetaData, a3);
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetaData, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOAction initWithIdentifier:]";
  v3 = 1024;
  v4 = 30;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
