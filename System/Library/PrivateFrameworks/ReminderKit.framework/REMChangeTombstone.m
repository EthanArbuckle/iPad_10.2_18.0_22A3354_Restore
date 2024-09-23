@implementation REMChangeTombstone

- (NSUUID)objectIdentifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method called -[%@ %@]"), v5, v6);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method called -[%@ %@]"), v5, v6);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Abstract method called -[%@ %@]"), v6, v7);

}

- (REMChangeTombstone)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Abstract method called -[%@ %@]"), v7, v8);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  uint64_t v6;
  REMChangeTombstone *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (REMChangeTombstone *)a3;
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Abstract method called -[%@ %@]"), v8, v9);

  return self == v7;
}

- (NSUUID)remObjectIdentifier
{
  return self->_remObjectIdentifier;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSNumber)daIsEventOnlyContainer
{
  return self->_daIsEventOnlyContainer;
}

- (NSUUID)shareeOwningListIdentifier
{
  return self->_shareeOwningListIdentifier;
}

- (NSString)shareeDisplayName
{
  return self->_shareeDisplayName;
}

- (NSString)shareeAddress
{
  return self->_shareeAddress;
}

- (NSUUID)assignmentOwningReminderIdentifier
{
  return self->_assignmentOwningReminderIdentifier;
}

- (NSString)hashtagName
{
  return self->_hashtagName;
}

- (NSUUID)hashtagReminderIdentifier
{
  return self->_hashtagReminderIdentifier;
}

- (NSUUID)hashtagLabelUUIDForChangeTracking
{
  return self->_hashtagLabelUUIDForChangeTracking;
}

- (NSUUID)syncActivityUUIDForChangeTracking
{
  return self->_syncActivityUUIDForChangeTracking;
}

- (NSUUID)dueDateDeltaAlertReminderIdentifier
{
  return self->_dueDateDeltaAlertReminderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlertReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_syncActivityUUIDForChangeTracking, 0);
  objc_storeStrong((id *)&self->_hashtagLabelUUIDForChangeTracking, 0);
  objc_storeStrong((id *)&self->_hashtagReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_hashtagName, 0);
  objc_storeStrong((id *)&self->_assignmentOwningReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_shareeAddress, 0);
  objc_storeStrong((id *)&self->_shareeDisplayName, 0);
  objc_storeStrong((id *)&self->_shareeOwningListIdentifier, 0);
  objc_storeStrong((id *)&self->_daIsEventOnlyContainer, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_remObjectIdentifier, 0);
}

@end
