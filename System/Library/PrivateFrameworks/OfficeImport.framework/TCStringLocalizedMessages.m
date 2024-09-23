@implementation TCStringLocalizedMessages

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;

  if ((id)objc_opt_class() == a1)
  {
    TCBundle();
    v86 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("Out of memory."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)kErrorMessageOutOfMemory;
    kErrorMessageOutOfMemory = v2;

    TCBundle();
    v87 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("An unknown error occurred."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)kErrorMessageUnknown;
    kErrorMessageUnknown = v4;

    TCBundle();
    v88 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("The file format is invalid."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)kErrorMessageInvalid;
    kErrorMessageInvalid = v6;

    TCBundle();
    v89 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("The spreadsheet has too many table cells."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)kErrorMessageTooManyCells;
    kErrorMessageTooManyCells = v8;

    TCBundle();
    v90 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("Decryption failed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)kErrorMessageDecryptionFailed;
    kErrorMessageDecryptionFailed = v10;

    TCBundle();
    v91 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("The document can\\U2019t be opened because it uses an unsupported method of encryption."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)kErrorMessageUnsupportedEncryption;
    kErrorMessageUnsupportedEncryption = v12;

    TCBundle();
    v92 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("Charts of unsupported type or size were either imported as an image or removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)kErrorMessageChartUnsupportedContent;
    kErrorMessageChartUnsupportedContent = v14;

    TCBundle();
    v93 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("Grouped wedges in pie charts were ungrouped."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)kWarningMessageChartsGroupedPieWedgesUngrouped;
    kWarningMessageChartsGroupedPieWedgesUngrouped = v16;

    TCBundle();
    v94 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("Custom number formats were removed from charts."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)kWarningMessageChartsCustomNumerFormatRemoved;
    kWarningMessageChartsCustomNumerFormatRemoved = v18;

    TCBundle();
    v95 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("Interactive charts were converted to regular charts."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)kWarningMessageChartsInteractiveTypesDowngraded;
    kWarningMessageChartsInteractiveTypesDowngraded = v20;

    TCBundle();
    v96 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("Bubble charts were converted to scatter charts."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)kWarningMessageChartsBubbleReplacedWithScatter;
    kWarningMessageChartsBubbleReplacedWithScatter = v22;

    TCBundle();
    v97 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "localizedStringForKey:value:table:", CFSTR("Reference Lines were removed from charts."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)kWarningMessageChartsReferenceLinesRemoved;
    kWarningMessageChartsReferenceLinesRemoved = v24;

    TCBundle();
    v98 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("Unsupported media were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)kWarningMessageUnsupportedMediaTypes;
    kWarningMessageUnsupportedMediaTypes = v26;

    TCBundle();
    v99 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("Links to other Keynote files were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)kWarningMessageNoKeynoteHyperlinks;
    kWarningMessageNoKeynoteHyperlinks = v28;

    TCBundle();
    v100 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Image fills may be missing from shapes, charts, or other objects."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)kWarningMessageMissingFills;
    kWarningMessageMissingFills = v30;

    TCBundle();
    v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("Image fills may be missing from shapes, charts, or other objects because you are not connected to the Internet."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)kWarningMessageMissingFillsBecauseNetworkNotReachable;
    kWarningMessageMissingFillsBecauseNetworkNotReachable = v32;

    TCBundle();
    v102 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("Rotation was removed from tables and charts."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)kWarningMessageChartsAndTablesUnrotated;
    kWarningMessageChartsAndTablesUnrotated = v34;

    TCBundle();
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected presentations to Keynote \\U201909, movies must be in .mov format."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)kWarningMessageMovieExportFailureLockedDocumentKeynote;
    kWarningMessageMovieExportFailureLockedDocumentKeynote = v36;

    TCBundle();
    v104 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected spreadsheets to Numbers \\U201909, movies must be in .mov format."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)kWarningMessageMovieExportFailureLockedDocumentNumbers;
    kWarningMessageMovieExportFailureLockedDocumentNumbers = v38;

    TCBundle();
    v105 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected documents to Pages \\U201909, movies must be in .mov format."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)kWarningMessageMovieExportFailureLockedDocumentPages;
    kWarningMessageMovieExportFailureLockedDocumentPages = v40;

    TCBundle();
    v106 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "localizedStringForKey:value:table:", CFSTR("Builds on master slides were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)kWarningMessageNoBuildsOnMasters;
    kWarningMessageNoBuildsOnMasters = v42;

    TCBundle();
    v107 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("Smart builds were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)kWarningMessageNoSmartBuilds;
    kWarningMessageNoSmartBuilds = v44;

    TCBundle();
    v108 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("Emphasis builds were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)kWarningMessageNoEmphasisBuilds;
    kWarningMessageNoEmphasisBuilds = v46;

    TCBundle();
    v109 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("Change tracking is only supported for body text. Other tracked changes were accepted as final."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)kWarningMessageNoTrackChangesButBody;
    kWarningMessageNoTrackChangesButBody = v48;

    TCBundle();
    v110 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("Unsupported formulas were replaced by the last calculated value."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)kWarningMessageUnsupportedFormulas;
    kWarningMessageUnsupportedFormulas = v50;

    TCBundle();
    v111 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "localizedStringForKey:value:table:", CFSTR("Table categories were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)kWarningMessageNoCategories;
    kWarningMessageNoCategories = v52;

    TCBundle();
    v112 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("Unsupported conditional highlighting rules were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)kWarningMessageNoConditionalFormats;
    kWarningMessageNoConditionalFormats = v54;

    TCBundle();
    v113 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("Table fills were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)kWarningMessageNoTableImageFill;
    kWarningMessageNoTableImageFill = v56;

    TCBundle();
    v114 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "localizedStringForKey:value:table:", CFSTR("Pop-up menu cells with more than 250 list items were converted to text cells."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)kWarningMessageTooManyPopupOptionsSomeDropped;
    kWarningMessageTooManyPopupOptionsSomeDropped = v58;

    TCBundle();
    v115 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "localizedStringForKey:value:table:", CFSTR("Some AND filters were changed to OR."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)kWarningMessageChangedAndFiltersToOrFilters;
    kWarningMessageChangedAndFiltersToOrFilters = v60;

    TCBundle();
    v116 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "localizedStringForKey:value:table:", CFSTR("Duration-based filters and conditional highlights were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)kWarningMessageRemovedDurationFiltersAndConditionalHighlightings;
    kWarningMessageRemovedDurationFiltersAndConditionalHighlightings = v62;

    TCBundle();
    v117 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("Right-to-left text isn\\U2019t fully supported in iWork \\U201909."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)kWarningMessageRTLNotFullySupported;
    kWarningMessageRTLNotFullySupported = v64;

    TCBundle();
    v118 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "localizedStringForKey:value:table:", CFSTR("Unsupported formulas were removed. The last calculated values were exported."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)kWarningMessageRemovedUnsupportedFormulas;
    kWarningMessageRemovedUnsupportedFormulas = v66;

    TCBundle();
    v119 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("No tables"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)kWarningMessageCSVExportFailureNoTables;
    kWarningMessageCSVExportFailureNoTables = v68;

    TCBundle();
    v120 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "localizedStringForKey:value:table:", CFSTR("Numbers creates a CSV file for each table in your spreadsheet."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)kWarningMessageCSVExportFailureNoTablesAdditionalInfo;
    kWarningMessageCSVExportFailureNoTablesAdditionalInfo = v70;

    TCBundle();
    v121 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("Charts in headers and footers were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)kWarningMessagePagesChartsInHeaderFooterNotSupported;
    kWarningMessagePagesChartsInHeaderFooterNotSupported = v72;

    TCBundle();
    v122 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "localizedStringForKey:value:table:", CFSTR("Tables in headers and footers were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)kWarningMessagePagesTablesInHeaderFooterNotSupported;
    kWarningMessagePagesTablesInHeaderFooterNotSupported = v74;

    TCBundle();
    v123 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "localizedStringForKey:value:table:", CFSTR("Objects in headers and footers were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)kWarningMessagePagesObjectsInHeaderFooterNotSupported;
    kWarningMessagePagesObjectsInHeaderFooterNotSupported = v76;

    TCBundle();
    v124 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "localizedStringForKey:value:table:", CFSTR("Inline objects that cause text wrap were removed from headers and footers."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = (void *)kWarningMessagePagesObjectsWithWrapInHeaderFooterNotSupported;
    kWarningMessagePagesObjectsWithWrapInHeaderFooterNotSupported = v78;

    TCBundle();
    v125 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("Outline view isn\\U2019t supported. Your document will appear as a regular word processing document."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)kWarningMessagePagesOutlineViewNotSupported;
    kWarningMessagePagesOutlineViewNotSupported = v80;

    TCBundle();
    v126 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "localizedStringForKey:value:table:", CFSTR("Mail merge isn\\U2019t supported. Merge fields were converted to text."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)kWarningMessagePagesMailMergeNotSupported;
    kWarningMessagePagesMailMergeNotSupported = v82;

    TCBundle();
    v127 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "localizedStringForKey:value:table:", CFSTR("The font %@ is missing. Your text might look different."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = (void *)kWarningMessageFontReplaced;
    kWarningMessageFontReplaced = v84;

  }
}

@end
