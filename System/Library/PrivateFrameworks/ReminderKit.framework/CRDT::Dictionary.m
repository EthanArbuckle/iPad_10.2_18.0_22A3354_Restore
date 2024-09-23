@implementation CRDT::Dictionary

CRDT::Dictionary_Element *__43__CRDictionary_initWithCRCoder_dictionary___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, void *a4)
{
  CRDT::Dictionary_Element *v6;
  CRDT::Dictionary_Element *v7;
  CRDT::Dictionary_Element *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a4;
  v7 = v6;
  if ((*(_BYTE *)(a2 + 32) & 2) != 0)
  {
    v9 = *(_QWORD *)(a2 + 48);
    if (!v9)
      v9 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance(v6) + 48);
    -[CRDT::Dictionary_Element decodeObjectForProtobufObjectID:](v7, "decodeObjectForProtobufObjectID:", v9);
    v6 = (CRDT::Dictionary_Element *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }
  *a3 = 0;
  if ((*(_BYTE *)(a2 + 32) & 1) != 0)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (!v10)
      v10 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance(v6) + 40);
    -[CRDT::Dictionary_Element decodeObjectForProtobufObjectID:](v7, "decodeObjectForProtobufObjectID:", v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
