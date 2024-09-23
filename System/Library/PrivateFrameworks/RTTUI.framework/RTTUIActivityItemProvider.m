@implementation RTTUIActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_opt_new();
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getLPLinkMetadataClass_softClass;
  v13 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getLPLinkMetadataClass_block_invoke;
    v9[3] = &unk_24D657DD0;
    v9[4] = &v10;
    __getLPLinkMetadataClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  v6 = objc_alloc_init(v5);
  ttyLocString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  return v6;
}

- (NSAttributedString)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
  objc_storeStrong((id *)&self->_transcript, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcript, 0);
}

@end
