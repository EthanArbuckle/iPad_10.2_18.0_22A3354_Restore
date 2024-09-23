@implementation TIWordSearchCandidateResultSet(TIWordSearchCangjie)

- (uint64_t)nthIndexIgnoringExtensionCandidates:()TIWordSearchCangjie
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;

  objc_msgSend(a1, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = 0;
  if (v5 && a3)
  {
    v7 = v5;
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isExtensionCandidate");

      if (++v6 >= v7)
        break;
      a3 -= v9 ^ 1u;
    }
    while (a3);
  }

  return v6;
}

@end
