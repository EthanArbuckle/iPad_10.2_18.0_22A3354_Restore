@implementation ICCloudClientCollaborationEditParams

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t itemAdamID;
  NSString *itemUUID;
  NSString *itemPositionUUID;
  NSString *referencePositionUUID;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  const char *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  switch(self->_type)
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = v4;
      itemAdamID = self->_itemAdamID;
      itemUUID = self->_itemUUID;
      itemPositionUUID = self->_itemPositionUUID;
      referencePositionUUID = self->_referencePositionUUID;
      if (referencePositionUUID)
        v10 = "after";
      else
        v10 = "to";
      if (referencePositionUUID)
      {
        objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: [ADD %lld %@/%@ %s %@]>"), v4, self, itemAdamID, itemUUID, itemPositionUUID, v10, referencePositionUUID);
        goto LABEL_16;
      }
      +[ICCloudClientCollaborationEditParams descriptionForPositionType:](ICCloudClientCollaborationEditParams, "descriptionForPositionType:", self->_positionType);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: [ADD %lld %@/%@ %s %@]>"), v5, self, itemAdamID, itemUUID, itemPositionUUID, v10, v20);
      goto LABEL_20;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [REMOVE %@]>"), objc_opt_class(), self, self->_itemUUID, v21, v22, v23, v24);
      goto LABEL_16;
    case 3:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      v14 = self->_itemUUID;
      v15 = self->_itemPositionUUID;
      v16 = self->_referencePositionUUID;
      if (v16)
        v17 = "after";
      else
        v17 = "to";
      if (v16)
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p: [MOVE %@/%@ %s %@]>"), v12, self, v14, v15, v17, v16, v24);
LABEL_16:
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[ICCloudClientCollaborationEditParams descriptionForPositionType:](ICCloudClientCollaborationEditParams, "descriptionForPositionType:", self->_positionType);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p: [MOVE %@/%@ %s %@]>"), v13, self, v14, v15, v17, v20, v24);
LABEL_20:
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      return v18;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [SET REACTION '%@' on %@]>"), objc_opt_class(), self, self->_reactionString, self->_itemUUID, v22, v23, v24);
      goto LABEL_16;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [UNSET REACTION '%@' on %@]>"), objc_opt_class(), self, self->_reactionString, self->_itemUUID, v22, v23, v24);
      goto LABEL_16;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [Uknown param type %ld]>"), objc_opt_class(), self, self->_type, v21, v22, v23, v24);
      goto LABEL_16;
  }
}

- (ICCloudClientCollaborationEditParams)initWithCoder:(id)a3
{
  id v4;
  ICCloudClientCollaborationEditParams *v5;
  uint64_t v6;
  NSString *itemUUID;
  uint64_t v8;
  NSString *itemPositionUUID;
  uint64_t v10;
  NSString *referencePositionUUID;
  uint64_t v12;
  NSString *reactionString;
  uint64_t v14;
  NSDate *timestamp;

  v4 = a3;
  v5 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v5->_type = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ICCloudClientCollaborationEditParamsTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCloudClientCollaborationEditParamsItemUUIDKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  itemUUID = v5->_itemUUID;
  v5->_itemUUID = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCloudClientCollaborationEditParamsItemPositionUUIDKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  itemPositionUUID = v5->_itemPositionUUID;
  v5->_itemPositionUUID = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCloudClientCollaborationEditParamsReferencePositionUUIDKey"));
  v10 = objc_claimAutoreleasedReturnValue();
  referencePositionUUID = v5->_referencePositionUUID;
  v5->_referencePositionUUID = (NSString *)v10;

  v5->_positionType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ICCloudClientCollaborationEditParamsPositionTypeKey"));
  v5->_itemAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICCloudClientCollaborationEditParamsItemAdamIDKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCloudClientCollaborationEditParamsReactionStringKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  reactionString = v5->_reactionString;
  v5->_reactionString = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCloudClientCollaborationEditParamsTimestampKey"));
  v14 = objc_claimAutoreleasedReturnValue();

  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v14;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type_low;
  id v5;

  type_low = LODWORD(self->_type);
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", type_low, CFSTR("ICCloudClientCollaborationEditParamsTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemUUID, CFSTR("ICCloudClientCollaborationEditParamsItemUUIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemPositionUUID, CFSTR("ICCloudClientCollaborationEditParamsItemPositionUUIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referencePositionUUID, CFSTR("ICCloudClientCollaborationEditParamsReferencePositionUUIDKey"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_positionType), CFSTR("ICCloudClientCollaborationEditParamsPositionTypeKey"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_itemAdamID, CFSTR("ICCloudClientCollaborationEditParamsItemAdamIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reactionString, CFSTR("ICCloudClientCollaborationEditParamsReactionStringKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("ICCloudClientCollaborationEditParamsTimestampKey"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)itemUUID
{
  return self->_itemUUID;
}

- (NSString)itemPositionUUID
{
  return self->_itemPositionUUID;
}

- (NSString)referencePositionUUID
{
  return self->_referencePositionUUID;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (unint64_t)itemAdamID
{
  return self->_itemAdamID;
}

- (NSString)reactionString
{
  return self->_reactionString;
}

- (void)setReactionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reactionString, 0);
  objc_storeStrong((id *)&self->_referencePositionUUID, 0);
  objc_storeStrong((id *)&self->_itemPositionUUID, 0);
  objc_storeStrong((id *)&self->_itemUUID, 0);
}

+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 afterReferencePositionUUD:(id)a6
{
  NSString *v9;
  NSString *v10;
  NSString *v11;
  ICCloudClientCollaborationEditParams *v12;
  NSString *itemUUID;
  NSString *v14;
  NSString *itemPositionUUID;
  NSString *v16;
  NSString *referencePositionUUID;

  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  v11 = (NSString *)a6;
  v12 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v12->_itemAdamID = a3;
  itemUUID = v12->_itemUUID;
  v12->_type = 1;
  v12->_itemUUID = v9;
  v14 = v9;

  itemPositionUUID = v12->_itemPositionUUID;
  v12->_itemPositionUUID = v10;
  v16 = v10;

  referencePositionUUID = v12->_referencePositionUUID;
  v12->_referencePositionUUID = v11;

  return v12;
}

+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 atPosition:(int64_t)a6
{
  NSString *v9;
  NSString *v10;
  ICCloudClientCollaborationEditParams *v11;
  NSString *itemUUID;
  NSString *v13;
  NSString *itemPositionUUID;

  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  v11 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v11->_itemAdamID = a3;
  itemUUID = v11->_itemUUID;
  v11->_type = 1;
  v11->_itemUUID = v9;
  v13 = v9;

  itemPositionUUID = v11->_itemPositionUUID;
  v11->_itemPositionUUID = v10;

  v11->_positionType = a6;
  return v11;
}

+ (id)paramsForRemovingTrackWithItemUUID:(id)a3
{
  NSString *v3;
  ICCloudClientCollaborationEditParams *v4;
  NSString *itemUUID;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v4->_itemUUID;
  v4->_type = 2;
  v4->_itemUUID = v3;

  return v4;
}

+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 afterReferencePositionUUD:(id)a5
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  ICCloudClientCollaborationEditParams *v10;
  NSString *itemUUID;
  NSString *v12;
  NSString *itemPositionUUID;
  NSString *v14;
  NSString *referencePositionUUID;

  v7 = (NSString *)a3;
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  v10 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v10->_itemUUID;
  v10->_type = 3;
  v10->_itemUUID = v7;
  v12 = v7;

  itemPositionUUID = v10->_itemPositionUUID;
  v10->_itemPositionUUID = v8;
  v14 = v8;

  referencePositionUUID = v10->_referencePositionUUID;
  v10->_referencePositionUUID = v9;

  return v10;
}

+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 toPosition:(int64_t)a5
{
  NSString *v7;
  NSString *v8;
  ICCloudClientCollaborationEditParams *v9;
  NSString *itemUUID;
  NSString *v11;
  NSString *itemPositionUUID;

  v7 = (NSString *)a3;
  v8 = (NSString *)a4;
  v9 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v9->_itemUUID;
  v9->_type = 3;
  v9->_itemUUID = v7;
  v11 = v7;

  itemPositionUUID = v9->_itemPositionUUID;
  v9->_itemPositionUUID = v8;

  v9->_positionType = a5;
  return v9;
}

+ (id)paramsForSettingReaction:(id)a3 onTrackWithItemUUID:(id)a4
{
  NSString *v5;
  NSString *v6;
  ICCloudClientCollaborationEditParams *v7;
  NSString *itemUUID;
  NSString *v9;
  NSString *reactionString;
  NSString *v11;
  uint64_t v12;
  NSDate *timestamp;

  v5 = (NSString *)a3;
  v6 = (NSString *)a4;
  v7 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v7->_itemUUID;
  v7->_type = 4;
  v7->_itemUUID = v6;
  v9 = v6;

  reactionString = v7->_reactionString;
  v7->_reactionString = v5;
  v11 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = objc_claimAutoreleasedReturnValue();
  timestamp = v7->_timestamp;
  v7->_timestamp = (NSDate *)v12;

  return v7;
}

+ (id)paramsForUnsettingReaction:(id)a3 onTrackWithItemUUID:(id)a4
{
  NSString *v5;
  NSString *v6;
  ICCloudClientCollaborationEditParams *v7;
  NSString *itemUUID;
  NSString *v9;
  NSString *reactionString;

  v5 = (NSString *)a3;
  v6 = (NSString *)a4;
  v7 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v7->_itemUUID;
  v7->_type = 5;
  v7->_itemUUID = v6;
  v9 = v6;

  reactionString = v7->_reactionString;
  v7->_reactionString = v5;

  return v7;
}

+ (id)newIdentifierString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForPositionType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Uknown");
  if (a3 == 2)
    v3 = CFSTR("End");
  if (a3 == 1)
    return CFSTR("Beginning");
  else
    return (id)v3;
}

@end
