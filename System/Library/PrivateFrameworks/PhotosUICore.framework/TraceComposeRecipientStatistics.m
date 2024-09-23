@implementation TraceComposeRecipientStatistics

void ___TraceComposeRecipientStatistics_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "containsObject:", v4);
  objc_msgSend(v4, "personSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = a1 + 48;
    if (v6)
      v7 = a1 + 40;
  }
  else
  {
    if (!v6)
      return;
    v7 = a1 + 56;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24);
}

@end
