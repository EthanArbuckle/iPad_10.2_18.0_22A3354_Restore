@implementation CRReplica

+ (id)unserialisedIdentifier
{
  if (unserialisedIdentifier_predicate != -1)
    dispatch_once(&unserialisedIdentifier_predicate, &__block_literal_global_49);
  return (id)unserialisedIdentifier_TTUnserialisedReplicaID;
}

void __35__CRReplica_unserialisedIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unserialisedIdentifier_TTUnserialisedReplicaID;
  unserialisedIdentifier_TTUnserialisedReplicaID = v0;

}

@end
