@implementation TCStringLocalizedMessages

+ (void)initialize
{
  if ((id)objc_opt_class(TCStringLocalizedMessages) == a1)
  {
    kErrorMessageOutOfMemory = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Out of memory."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kErrorMessageUnknown = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("An unknown error occurred."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kErrorMessageInvalid = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("The file format is invalid."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kErrorMessageTooManyCells = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("The spreadsheet has too many table cells."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kErrorMessageDecryptionFailed = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Decryption failed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kErrorMessageUnsupportedEncryption = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("The document can\\U2019t be opened because it uses an unsupported method of encryption."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageChartsGroupedPieWedgesUngrouped = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Grouped wedges in pie charts were ungrouped."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageChartsCustomNumerFormatRemoved = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Custom number formats were removed from charts."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageChartsInteractiveTypesDowngraded = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Interactive charts were converted to regular charts."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageChartsBubbleReplacedWithScatter = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Bubble charts were converted to scatter charts."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageUnsupportedMediaTypes = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Unsupported media were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoKeynoteHyperlinks = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Links to other Keynote files were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageUndisplayableMedia = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some media won\\U2019t display on iOS."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMissingFills = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Image fills may be missing from shapes, charts, or other objects."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMissingFillsBecauseNetworkNotReachable = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Image fills may be missing from shapes, charts, or other objects because you are not connected to the Internet."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMissingImagesBecauseUserCancelledDownload = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Placeholder images are missing because they weren\\U2019t downloaded."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMissingImagesBecauseNetworkNotReachable = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Placeholder images are missing because your iOS device isn\\U2019t connected to the Internet."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMissingImagesBecauseOfDownloadError = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Placeholder images are missing because they couldn\\U2019t be downloaded."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMovieExportFailureLockedDocumentKeynote = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected presentations to Keynote \\U201909, movies must be in .mov format."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMovieExportFailureLockedDocumentNumbers = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected spreadsheets to Numbers \\U201909, movies must be in .mov format."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageMovieExportFailureLockedDocumentPages = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some movies may not play correctly. When exporting password-protected documents to Pages \\U201909, movies must be in .mov format."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoBuildsOnMasters = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Builds on master slides were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoSmartBuilds = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Smart builds were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoEmphasisBuilds = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Emphasis builds were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoTrackChangesButBody = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Change tracking is only supported for body text. Other tracked changes were accepted as final."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageUnsupportedFormulas = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Unsupported formulas were removed. The last calculated values were imported."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoCategories = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Table categories were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoConditionalFormats = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Unsupported conditional formats were removed from table cells."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageNoTableImageFill = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Table fills were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageTooManyStrokesSomeDropped = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some cell borders were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageTooManyPopupOptionsSomeDropped = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Pop-up menu cells with more than 250 list items were converted to text cells."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageChangedAndFiltersToOrFilters = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Some AND filters were changed to OR."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageRemovedDurationFiltersAndConditionalHighlightings = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Duration-based filters and conditional highlights were removed."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageRTLNotFullySupported = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Right-to-left text isn\\U2019t fully supported in iWork \\U201909."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageRemovedUnsupportedFormulas = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("Unsupported formulas were removed. The last calculated values were exported."), &stru_43D7D8, CFSTR("TCCompatibility"));
    kWarningMessageFontReplaced = (uint64_t)objc_msgSend((id)TCBundle(), "localizedStringForKey:value:table:", CFSTR("The font %@ isn’t available on iOS. It was replaced with %@."), &stru_43D7D8, CFSTR("TCCompatibility"));
  }
}

@end
