@implementation TCCommonMessages

+ (void)initialize
{
  TCTaggedMessage *v2;
  uint64_t v3;
  void *v4;
  TCTaggedMessage *v5;
  uint64_t v6;
  void *v7;
  TCTaggedMessage *v8;
  uint64_t v9;
  void *v10;
  TCTaggedMessage *v11;
  uint64_t v12;
  void *v13;
  TCTaggedMessage *v14;
  uint64_t v15;
  void *v16;
  TCTaggedMessage *v17;
  uint64_t v18;
  void *v19;
  TCTaggedMessage *v20;
  uint64_t v21;
  void *v22;
  TCTaggedMessage *v23;
  uint64_t v24;
  void *v25;
  TCTaggedMessage *v26;
  uint64_t v27;
  void *v28;
  TCTaggedMessage *v29;
  uint64_t v30;
  void *v31;
  TCTaggedMessage *v32;
  uint64_t v33;
  void *v34;
  TCTaggedMessage *v35;
  uint64_t v36;
  void *v37;
  TCTaggedMessage *v38;
  uint64_t v39;
  void *v40;
  TCTaggedMessage *v41;
  uint64_t v42;
  void *v43;
  TCTaggedMessage *v44;
  uint64_t v45;
  void *v46;

  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    v3 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", kErrorMessageOutOfMemory);
    v4 = (void *)TCOutOfMemoryMessage;
    TCOutOfMemoryMessage = v3;

    v5 = [TCTaggedMessage alloc];
    v6 = -[TCTaggedMessage initWithMessageText:](v5, "initWithMessageText:", kErrorMessageUnknown);
    v7 = (void *)TCUnknownProblemMessage;
    TCUnknownProblemMessage = v6;

    v8 = [TCTaggedMessage alloc];
    v9 = -[TCTaggedMessage initWithMessageText:](v8, "initWithMessageText:", kErrorMessageInvalid);
    v10 = (void *)TCInvalidFileFormatMessage;
    TCInvalidFileFormatMessage = v9;

    v11 = [TCTaggedMessage alloc];
    v12 = -[TCTaggedMessage initWithMessageText:](v11, "initWithMessageText:", kErrorMessageDecryptionFailed);
    v13 = (void *)TCDecryptionFailedMessage;
    TCDecryptionFailedMessage = v12;

    v14 = [TCTaggedMessage alloc];
    v15 = -[TCTaggedMessage initWithMessageText:](v14, "initWithMessageText:", kWarningMessageNoTrackChangesButBody);
    v16 = (void *)TCNoImportOfNonBodyTrackedChangesMsg;
    TCNoImportOfNonBodyTrackedChangesMsg = v15;

    v17 = [TCTaggedMessage alloc];
    v18 = -[TCTaggedMessage initWithMessageText:](v17, "initWithMessageText:", kWarningMessageChangedAndFiltersToOrFilters);
    v19 = (void *)TCChangedAndFiltersToOrFiltersMessage;
    TCChangedAndFiltersToOrFiltersMessage = v18;

    v20 = [TCTaggedMessage alloc];
    v21 = -[TCTaggedMessage initWithMessageText:](v20, "initWithMessageText:", kWarningMessageRemovedDurationFiltersAndConditionalHighlightings);
    v22 = (void *)TCRemovedDurationFiltersAndConditionalHighlightingsMessage;
    TCRemovedDurationFiltersAndConditionalHighlightingsMessage = v21;

    v23 = [TCTaggedMessage alloc];
    v24 = -[TCTaggedMessage initWithMessageText:](v23, "initWithMessageText:", kWarningMessageRTLNotFullySupported);
    v25 = (void *)TCExportRTLNotFullySupportedMessage;
    TCExportRTLNotFullySupportedMessage = v24;

    v26 = [TCTaggedMessage alloc];
    v27 = -[TCTaggedMessage initWithMessageText:](v26, "initWithMessageText:", kWarningMessageRemovedUnsupportedFormulas);
    v28 = (void *)TCRemovedUnsupportedFormulasMessage;
    TCRemovedUnsupportedFormulasMessage = v27;

    v29 = [TCTaggedMessage alloc];
    v30 = -[TCTaggedMessage initWithMessageText:](v29, "initWithMessageText:", kWarningMessageCSVExportFailureNoTables);
    v31 = (void *)TCExportDocumentHasNoTablesMessage;
    TCExportDocumentHasNoTablesMessage = v30;

    v32 = [TCTaggedMessage alloc];
    v33 = -[TCTaggedMessage initWithMessageText:](v32, "initWithMessageText:", kErrorMessageChartUnsupportedContent);
    v34 = (void *)TCChartUnsupportedContent;
    TCChartUnsupportedContent = v33;

    v35 = [TCTaggedMessage alloc];
    v36 = -[TCTaggedMessage initWithMessageText:](v35, "initWithMessageText:", kWarningMessageChartsInteractiveTypesDowngraded);
    v37 = (void *)TCChartsInteractiveTypesDowngradedMessage;
    TCChartsInteractiveTypesDowngradedMessage = v36;

    v38 = [TCTaggedMessage alloc];
    v39 = -[TCTaggedMessage initWithMessageText:](v38, "initWithMessageText:", kWarningMessageChartsBubbleReplacedWithScatter);
    v40 = (void *)TCChartsBubbleReplacedWithScatterMessage;
    TCChartsBubbleReplacedWithScatterMessage = v39;

    v41 = [TCTaggedMessage alloc];
    v42 = -[TCTaggedMessage initWithMessageText:](v41, "initWithMessageText:", kWarningMessageChartsReferenceLinesRemoved);
    v43 = (void *)TCChartsReferenceLinesRemovedMessage;
    TCChartsReferenceLinesRemovedMessage = v42;

    v44 = [TCTaggedMessage alloc];
    v45 = -[TCTaggedMessage initWithMessageText:](v44, "initWithMessageText:", kWarningMessageNoEmphasisBuilds);
    v46 = (void *)TCKeynoteRemovedBuild;
    TCKeynoteRemovedBuild = v45;

  }
}

@end
