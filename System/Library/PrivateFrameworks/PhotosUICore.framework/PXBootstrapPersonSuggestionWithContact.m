@implementation PXBootstrapPersonSuggestionWithContact

void __PXBootstrapPersonSuggestionWithContact_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71680], "matchingDictionaryForContact:contactStore:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContactMatchingDictionary:", v3);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonUri:", v4);

  objc_msgSend(v5, "setName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setDisplayName:", *(_QWORD *)(a1 + 56));

}

@end
