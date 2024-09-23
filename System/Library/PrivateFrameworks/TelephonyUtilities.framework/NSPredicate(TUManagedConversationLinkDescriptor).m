@implementation NSPredicate(TUManagedConversationLinkDescriptor)

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithActivated:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("activated = %d"), a3);
}

+ (id)tu_predicateForConversationLinkDescriptorsIsDeleted:()TUManagedConversationLinkDescriptor
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("deletionDate != NULL");
  else
    v3 = CFSTR("deletionDate == NULL");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithCreationDate:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate == %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDate:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("expirationDate == %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithDeletionDate:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("deletionDate == %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDateAfter:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("expirationDate > %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithGroupUUID:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("groupUUID == %@"), a3);
}

+ (id)tu_predicateForConversationLinkDescriptorsWithInvitedHandle:()TUManagedConversationLinkDescriptor
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "normalizedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleNormalizedValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleType:", objc_msgSend(v4, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleNormalizedValue:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY invitedHandles.normalizedValue ==[c] %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleType:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY invitedHandles.type = %d"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleValue:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY invitedHandles.value ==[c] %@"), a3);
}

+ (id)tu_predicateForConversationLinkDescriptorsWithOriginatorHandle:()TUManagedConversationLinkDescriptor
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "normalizedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleNormalizedValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleType:", objc_msgSend(v4, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleNormalizedValue:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY originatorHandle.normalizedValue ==[c] %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleType:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY originatorHandle.type = %d"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleValue:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY originatorHandle.value ==[c] %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPseudonym:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pseudonym = %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPublicKey:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("publicKey = %@"), a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPrivateKey:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("privateKey = %@"), a3);
}

@end
