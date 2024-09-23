@implementation CRLAccessibility

- (BOOL)quickSpeakSupportLoaded
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415558);
}

- (void)setQuickSpeakSupportLoaded:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415558, a3);
}

- (BOOL)shouldFakeQuickSpeakAlwaysSpeaking
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415559);
}

- (void)setShouldFakeQuickSpeakAlwaysSpeaking:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415559, a3);
}

- (BOOL)_isKeyboardVisible
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_10141555A);
}

- (void)_setKeyboardVisible:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_10141555A, a3);
}

- (CGRect)_keyboardFrame
{
  double AssociatedCGRect;
  double v3;
  double v4;
  double v5;
  CGRect result;

  AssociatedCGRect = __CRLAccessibilityGetAssociatedCGRect(self, &unk_10141555B);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = AssociatedCGRect;
  return result;
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  __CRLAccessibilitySetAssociatedCGRect(self, &unk_10141555B, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)cachedFirstElementForUpcomingScreenChange
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_10141555C);
}

- (void)setCachedFirstElementForUpcomingScreenChange:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_10141555C, a3);
}

- (unint64_t)firstElementForUpcomingScreenChangeResetCount
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_10141555D);
}

- (void)setFirstElementForUpcomingScreenChangeResetCount:(unint64_t)a3
{
  __CRLAccessibilitySetAssociatedUnsignedInteger(self, &unk_10141555D, (id)a3);
}

- (id)cachedFirstElementForUpcomingPageTurn
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_10141555E);
}

- (void)setCachedFirstElementForUpcomingPageTurn:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_10141555E, a3);
}

- (unint64_t)firstElementForUpcomingPageTurnResetCount
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_10141555F);
}

- (void)setFirstElementForUpcomingPageTurnResetCount:(unint64_t)a3
{
  __CRLAccessibilitySetAssociatedUnsignedInteger(self, &unk_10141555F, (id)a3);
}

- (BOOL)shouldPreventFocusingCanvasResponderElementOnScreenChange
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415560);
}

- (void)setShouldPreventFocusingCanvasResponderElementOnScreenChange:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415560, a3);
}

- (BOOL)_systemVersionIsGreaterOrEqualTo:(id)a3
{
  return -[NSString compare:options:](-[UIDevice systemVersion](+[UIDevice currentDevice](UIDevice, "currentDevice"), "systemVersion"), "compare:options:", a3, 64) != NSOrderedAscending;
}

- (void)_keyboardWasShown:(id)a3
{
  -[CRLAccessibility _setKeyboardVisible:](self, "_setKeyboardVisible:", 1);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", UIKeyboardFrameEndUserInfoKey), "CGRectValue");
  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:");
}

- (void)_keyboardWillBeHidden:(id)a3
{
  -[CRLAccessibility _setKeyboardVisible:](self, "_setKeyboardVisible:", 0);
  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (id)preferencesDomain
{
  return CFSTR("com.apple.Accessibility");
}

- (void)performExtraValidation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;

  __CRLAccessibilityValidateIsKindOfClass(CFSTR("_UIShareInvitationRemoteViewController"), CFSTR("_UIRemoteViewController"));
  __CRLAccessibilityValidateClassMethodComplete(CFSTR("_UIRemoteViewController"), CFSTR("__shouldHostRemoteTextEffectsWindow"), "B", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityFrameForSorting"), "{CGRect={CGPoint=dd}{CGSize=dd}}", v7, v8, v9, v10, v11, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityHasTextOperations"), "B", v12, v13, v14, v15, v16, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityLoadAccessibilityInformation"), "v", v17, v18, v19, v20, v21, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityOverridesInstructionsHint"), "B", v22, v23, v24, v25, v26, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityParentView"), "@", v27, v28, v29, v30, v31, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityPerformCustomActionWithIdentifier:"), "B", v32, v33, v34, v35, v36, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityScrollToVisible"), "B", v37, v38, v39, v40, v41, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityTextOperationAction:"), "B", v42, v43, v44, v45, v46, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityTextViewTextOperationResponder"), "@", v47, v48, v49, v50, v51, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("_accessibilityTextOperations"), "@", v52, v53, v54, v55, v56, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("accessibilityMenuActions"), "@", v57, v58, v59, v60, v61, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("NSObject"), CFSTR("accessibilityEditOperationAction:"), "B", v62, v63, v64, v65, v66, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("PHAsset"), CFSTR("filename"), "@", v67, v68, v69, v70, v71, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("PHAsset"), CFSTR("mediaType"), "q", v72, v73, v74, v75, v76, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("PHAsset"), CFSTR("mediaSubtypes"), "Q", v77, v78, v79, v80, v81, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIApplication"), CFSTR("_accessibilitySoftwareKeyboardActive"), "B", v82, v83, v84, v85, v86, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIApplication"), CFSTR("_unswizzledTargetInChainForAction:sender:"), "@", v87, v88, v89, v90, v91, ":");
  __CRLAccessibilityValidateIsKindOfClass(CFSTR("UILayoutContainerView"), CFSTR("UIView"));
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UILayoutContainerView"), CFSTR("delegate"), "@", v92, v93, v94, v95, v96, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UINavigationController"), CFSTR("didShowViewController:animated:"), "v", v97, v98, v99, v100, v101, "@");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UINavigationController"), CFSTR("navigationTransitionView"), "@", v102, v103, v104, v105, v106, 0);
  __CRLAccessibilityValidateIvarType(CFSTR("UINavigationController"), "_topPalette", "_UINavigationControllerPalette");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIScrollView"), CFSTR("_accessibilityScrollStatusPrefersVertical"), "B", v107, v108, v109, v110, v111, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIScrollView"), CFSTR("accessibilityApplyScrollContent:sendScrollStatus:animated:"), "v", v112, v113, v114, v115, v116, "{CGPoint=dd}");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIScrollView"), CFSTR("accessibilityShouldEnableScrollIndicator:"), "B", v117, v118, v119, v120, v121, "@");
  __CRLAccessibilityValidateIvarType(CFSTR("UISlider"), "_visualElement", "UIView<_UISliderVisualElement>");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("_UISlideriOSVisualElement"), CFSTR("_setValue:andSendAction:"), "v", v122, v123, v124, v125, v126, "f");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_accessibilityChildren"), "@", v127, v128, v129, v130, v131, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", v132, v133, v134, v135, v136, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_accessibilityRetrieveTableViewCellText"), "@", v137, v138, v139, v140, v141, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_accessibilityRetrieveTableViewIvarsText"), "@", v142, v143, v144, v145, v146, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_accessibilityTableViewCellSubclassShouldExist"), "B", v147, v148, v149, v150, v151, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UITableViewCell"), CFSTR("_tableView"), "@", v152, v153, v154, v155, v156, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIView"), CFSTR("_accessibilityViewController"), "@", v157, v158, v159, v160, v161, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIView"), CFSTR("_accessibleSubviews"), "@", v162, v163, v164, v165, v166, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIWindow"), CFSTR("firstResponder"), "@", v167, v168, v169, v170, v171, 0);
  __CRLAccessibilityValidateClassMethod(CFSTR("UICalloutBar"), CFSTR("sharedCalloutBar"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("NSObject"), CFSTR("_accessibilityShouldUseViewHierarchyForFindingScrollParent"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIApplication"), CFSTR("_accessibilityElementFirst:last:forFocus:parameters:"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIApplication"), CFSTR("_accessibilityMainWindow"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIDimmingView"), CFSTR("passthroughViews"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIPopoverController"), CFSTR("dimmingViewWasTapped:"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIScrollView"), CFSTR("_accessibilityScrollAnimationDurationDelay"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIScrollView"), CFSTR("_accessibilityScrollStatus"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIScrollView"), CFSTR("_accessibilityScrollStatusFormatString"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UITableViewCell"), CFSTR("editControlWasClicked:"));
  __CRLAccessibilityValidateInstanceMethod(CFSTR("UIView"), CFSTR("_accessibleSubviews"));
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIScrollView"), CFSTR("_setContentOffset:duration:animationCurve:"), "v", v172, v173, v174, v175, v176, "{CGPoint=dd}");
}

- (void)addExtraSafeCategoryNamesToCollection:(id)a3
{
  objc_msgSend(a3, "addObject:", CFSTR("CRLNSObjectAccessibility_iOS"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIApplicationAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIButtonAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUICollectionViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUILabelAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUILayoutContainerViewAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIMenuControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUINavigationItemAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIPageControlAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIAccessibilityPickerComponentAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIReferenceLibraryViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIScrollViewAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUISliderAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUITableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUITextEffectsRemoteViewAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIViewAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLUIWindowAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLiOSBoardViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLToolsChooserViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLShapeLayoutAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLCheckableTableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLDisclosureTableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLDoubleSegmentedControlTableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLiOSCanvasViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLSegmentedControlTableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLSwitchTableViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLTickedSliderAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLTextInputResponderAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLScrollViewAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLEditableTextViewCellAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLPopoverBasedViewControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLStepperAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLNavigationControllerAccessibility"));
  objc_msgSend(a3, "addObject:", CFSTR("CRLSegmentedControlAccessibility"));
}

- (void)loadExtraAccessibilitySupport
{
  NSNotificationCenter *v3;

  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "_keyboardWasShown:", UIKeyboardDidShowNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", self, "_keyboardWillBeHidden:", UIKeyboardWillHideNotification, 0);
}

- (void)unloadExtraAccessibilitySupport
{
  NSNotificationCenter *v3;

  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  -[CRLAccessibility _setKeyboardFrame:](self, "_setKeyboardFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (void)handlePostingAnnouncement:(id)a3 sender:(id)a4 priority:(int)a5 sound:(id)a6
{
  uint64_t v7;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id argument;

  v7 = *(_QWORD *)&a5;
  if (!-[CRLAccessibility announcementsSuspended](self, "announcementsSuspended", a3, a4))
  {
    if (a6)
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a6);
    if (objc_msgSend(a3, "length"))
    {
      if ((_DWORD)v7 == 5)
      {
        argument = a3;
      }
      else
      {
        v16 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v7);
        v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v16, CFSTR("UIAccessibilityTokenAnnouncementPriority"), 0);

        argument = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", a3, v17);
      }
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, argument);

    }
    else
    {
      ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
      if (!a6)
      {
        if (ShouldPerformValidationChecks)
        {
          ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Nil or empty announcement requested without sound played."), v11, v12, v13, v14, v15, v18))abort();
        }
      }
    }
  }
}

- (void)loadQuickSpeakSupport
{
  if (!-[CRLAccessibility quickSpeakSupportLoaded](self, "quickSpeakSupportLoaded")
    && NSClassFromString(CFSTR("AXQuickSpeak")))
  {
    -[CRLAccessibility setQuickSpeakSupportLoaded:](self, "setQuickSpeakSupportLoaded:", 1);
    if (CRLAccessibilityShouldPerformValidationChecks())
      __CRLAccessibilityValidateInstanceMethod(CFSTR("AXQuickSpeak"), CFSTR("isSpeaking"));
    CRLAccessibilityInstallSafeCategory(CFSTR("CRLAXQuickSpeak"));
  }
}

- (BOOL)isQuickSpeakEnabled
{
  _BOOL4 v3;
  _BOOL8 v4;
  unsigned __int8 v5;

  v3 = -[CRLAccessibility quickSpeakSupportLoaded](self, "quickSpeakSupportLoaded");
  if (v3)
  {
    v4 = -[CRLAccessibility shouldFakeQuickSpeakAlwaysSpeaking](self, "shouldFakeQuickSpeakAlwaysSpeaking");
    -[CRLAccessibility setShouldFakeQuickSpeakAlwaysSpeaking:](self, "setShouldFakeQuickSpeakAlwaysSpeaking:", 1);
    v5 = -[CRLAccessibility crlaxBoolValueForKey:](self, "crlaxBoolValueForKey:", CFSTR("_accessibilityShouldShowPauseBubble"));
    -[CRLAccessibility setShouldFakeQuickSpeakAlwaysSpeaking:](self, "setShouldFakeQuickSpeakAlwaysSpeaking:", v4);
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isKeyboardVisible
{
  return -[CRLAccessibility _isKeyboardVisible](self, "_isKeyboardVisible");
}

- (CGRect)keyboardFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLAccessibility _keyboardFrame](self, "_keyboardFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isFocusedElementAccessibleDescendantOfElement:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v4 = objc_msgSend(a3, "crlaxValueForKey:", CFSTR("_accessibleSubviews"));
  objc_opt_class(NSArray, v5);
  v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v10);
  if (v10)
    abort();
  v8 = (void *)v7;
  if (+[CRLAccessibility currentlyFocusedElement](CRLAccessibility, "currentlyFocusedElement") == a3)
    return 1;
  else
    return objc_msgSend(v8, "containsObject:", +[CRLAccessibility currentlyFocusedElement](CRLAccessibility, "currentlyFocusedElement"));
}

- (void)setFirstElementForUpcomingScreenChange:(id)a3
{
  _QWORD v5[5];

  if (-[CRLAccessibility cachedFirstElementForUpcomingScreenChange](self, "cachedFirstElementForUpcomingScreenChange") != a3)
  {
    -[CRLAccessibility setCachedFirstElementForUpcomingScreenChange:](self, "setCachedFirstElementForUpcomingScreenChange:", a3);
    -[CRLAccessibility setFirstElementForUpcomingScreenChangeResetCount:](self, "setFirstElementForUpcomingScreenChangeResetCount:", (char *)-[CRLAccessibility firstElementForUpcomingScreenChangeResetCount](self, "firstElementForUpcomingScreenChangeResetCount")+ 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10034B6B0;
    v5[3] = &unk_101254068;
    v5[4] = self;
    CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

- (void)setFirstElementForUpcomingPageTurn:(id)a3
{
  _QWORD v5[5];

  if (-[CRLAccessibility cachedFirstElementForUpcomingPageTurn](self, "cachedFirstElementForUpcomingPageTurn") != a3)
  {
    -[CRLAccessibility setCachedFirstElementForUpcomingPageTurn:](self, "setCachedFirstElementForUpcomingPageTurn:", a3);
    -[CRLAccessibility setFirstElementForUpcomingPageTurnResetCount:](self, "setFirstElementForUpcomingPageTurnResetCount:", (char *)-[CRLAccessibility firstElementForUpcomingPageTurnResetCount](self, "firstElementForUpcomingPageTurnResetCount")+ 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10034B7A0;
    v5[3] = &unk_101254068;
    v5[4] = self;
    CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 5.0);
  }
}

- (void)preventFocusingCanvasResponderElementOnScreenChangeForInterval:(double)a3
{
  _QWORD v5[5];

  if (!qword_101415568)
  {
    qword_101415568 = -[CRLAccessibilityTimer initWithTargetSerialQueue:]([CRLAccessibilityTimer alloc], "initWithTargetSerialQueue:", &_dispatch_main_q);
    objc_msgSend((id)qword_101415568, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  -[CRLAccessibility setShouldPreventFocusingCanvasResponderElementOnScreenChange:](self, "setShouldPreventFocusingCanvasResponderElementOnScreenChange:", 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10034B8AC;
  v5[3] = &unk_101254068;
  v5[4] = self;
  objc_msgSend((id)qword_101415568, "afterDelay:processBlock:", v5, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003876CC;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_1014155E8 != -1)
    dispatch_once(&qword_1014155E8, block);
  return (id)qword_1014155E0;
}

- (void)dealloc
{
  objc_super v3;

  if (-[CRLAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityExtras)&& (objc_opt_respondsToSelector(self, "unloadExtraAccessibilitySupport") & 1) != 0)
  {
    -[CRLAccessibility unloadExtraAccessibilitySupport](self, "unloadExtraAccessibilitySupport");
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAccessibility;
  -[CRLAccessibility dealloc](&v3, "dealloc");
}

+ (BOOL)isUsingAccessibilityTextSize
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

+ (BOOL)isVoiceControlEnabled
{
  return _AXSCommandAndControlEnabled(a1, a2) != 0;
}

+ (BOOL)isFullKeyboardAccessEnabledWithKeyboardAttached
{
  int v2;

  v2 = _AXSFullKeyboardAccessEnabled(a1, a2);
  if (v2)
    LOBYTE(v2) = GSEventIsHardwareKeyboardAttached() != 0;
  return v2;
}

+ (BOOL)isVoiceOverOrSwitchControlEnabled
{
  if (+[CRLAccessibility isVoiceOverEnabled](CRLAccessibility, "isVoiceOverEnabled"))
    return 1;
  else
    return +[CRLAccessibility isSwitchControlEnabled](CRLAccessibility, "isSwitchControlEnabled");
}

+ (BOOL)shouldRemoveMovementAnimations
{
  if (+[CRLAccessibility isVoiceOverEnabled](CRLAccessibility, "isVoiceOverEnabled"))
    return 1;
  else
    return +[CRLAccessibility isPreferCrossFadeTransitionsEnabled](CRLAccessibility, "isPreferCrossFadeTransitionsEnabled");
}

+ (id)currentlyFocusedElement
{
  return UIAccessibilityFocusedElement(UIAccessibilityNotificationVoiceOverIdentifier);
}

- (void)performValidation
{
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSString *v8;
  Class v9;
  Class v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v2 = (_UNKNOWN **)qword_1014155F0;
  if (!qword_1014155F0)
  {
    qword_1014155F0 = (uint64_t)&off_1012CB908;

    v2 = &off_1012CB908;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NSString **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v9 = NSClassFromString(v8);
        if (v9)
        {
          v10 = v9;
          if (-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityValidator))
          {
            -[objc_class performValidations](v10, "performValidations");
            if (-[objc_class conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityValidatorExtras))-[objc_class performPlatformSpecificValidations](v10, "performPlatformSpecificValidations");
            continue;
          }
          if (!CRLAccessibilityShouldPerformValidationChecks())
            continue;
          ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          v17 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("%@ must conform to the CRLAccessibilityValidator protocol"), v19, v20, v21, v22, v23, (uint64_t)v8);
        }
        else
        {
          if (!CRLAccessibilityShouldPerformValidationChecks())
            continue;
          v11 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          v17 = __CRLAccessibilityHandleValidationErrorWithDescription(v11, 0, (uint64_t)CFSTR("Couldn't find validator class %@"), v12, v13, v14, v15, v16, (uint64_t)v8);
        }
        if (v17)
          abort();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addObject:", CFSTR("CRLCALayerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLFindReplaceControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLInteractiveCanvasControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLUndoManagerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLAngleGradientFillAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLAudioRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLBoardItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLMovieItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLBoardItemSelectionAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLBrushStrokeAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCalligraphyStrokeAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasEditorHelperAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasInteractiveCanvasControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasKnobAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasLayerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasLayoutAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasLayoutGeometryAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasMovieKnobAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLUnknownRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasResizeKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShapeControlKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShapeConnectionLineKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLConnectionLineKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShapeLineSegmentKnobTrackerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLCanvasViewAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLColorFillAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLConnectionLinePathSourceAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLConnectionLineRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLConnectionLineAbstractLayoutAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLContainerRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLDropShadowAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLEditorControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLFillAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLFreehandDrawingRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLGradientFillAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLGradientFillStopAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLGroupItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLGroupRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLImageFillAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLImageItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLImageLayoutAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLImageRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLItemGeometryAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLKeyboardMovementManipulatorAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLLineEndAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLMovieItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLMovieRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLPathSourceAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLScalarPathSourceAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShadowAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShapeItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLShapeRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLSmartStrokeAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLStrokeAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLStrokePatternAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLAVPlayerControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLRulerUnitsAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLSelectionPathAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLSubselectionAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLColumnAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLHyperlinkFieldAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLLineSpacingAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLTabsAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLTextEditorAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLTextInteractiveCanvasControllerAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLTextLayoutAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLTextRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPAttachmentAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPSearchReferenceAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPSelectionAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPShapeItemAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPShapeRepAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPSmartFieldAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLWPStorageAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLBezierPathAccessibility"));
  objc_msgSend(v3, "addObject:", CFSTR("CRLColorAccessibility"));

}

- (void)loadAccessibilitySupport
{
  NSMutableSet *v3;

  if (!-[CRLAccessibility accessibilitySupportLoaded](self, "accessibilitySupportLoaded"))
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      -[CRLAccessibility performValidation](self, "performValidation");
      if (-[CRLAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityExtras))
      {
        if ((objc_opt_respondsToSelector(self, "performExtraValidation") & 1) != 0)
          -[CRLAccessibility performExtraValidation](self, "performExtraValidation");
      }
    }
    v3 = objc_opt_new(NSMutableSet);
    -[CRLAccessibility addSafeCategoryNamesToCollection:](self, "addSafeCategoryNamesToCollection:");
    if (-[CRLAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityExtras)&& (objc_opt_respondsToSelector(self, "addExtraSafeCategoryNamesToCollection:") & 1) != 0)
    {
      -[CRLAccessibility addExtraSafeCategoryNamesToCollection:](self, "addExtraSafeCategoryNamesToCollection:", v3);
    }
    CRLAccessibilityInstallSafeCategories(v3);
    if (-[CRLAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___CRLAccessibilityExtras))
    {
      if ((objc_opt_respondsToSelector(self, "loadExtraAccessibilitySupport") & 1) != 0)
        -[CRLAccessibility loadExtraAccessibilitySupport](self, "loadExtraAccessibilitySupport");
    }
    -[CRLAccessibility setAccessibilitySupportLoaded:](self, "setAccessibilitySupportLoaded:", 1);

  }
}

- (BOOL)supportsCharts
{
  return 1;
}

- (BOOL)supportsTableEditing
{
  return 1;
}

- (BOOL)supportsAdvancedTextSearchExperience
{
  return 0;
}

- (id)canvasViewDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Canvas"), 0, 0));

  return v3;
}

- (id)canvasViewHelp
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Format, move, and resize items within the Canvas"), 0, 0));

  return v3;
}

- (void)suspendAnnouncements
{
  self->_announcementsSuspended = 1;
}

- (void)resumeAnnouncements
{
  self->_announcementsSuspended = 0;
}

+ (NSString)iOSBoardViewControllerScrollViewIdentifier
{
  return (NSString *)CFSTR("iOS Board View Scroll View");
}

- (BOOL)announcementsSuspended
{
  return self->_announcementsSuspended;
}

- (BOOL)accessibilitySupportLoaded
{
  return self->_accessibilitySupportLoaded;
}

- (void)setAccessibilitySupportLoaded:(BOOL)a3
{
  self->_accessibilitySupportLoaded = a3;
}

@end
