@implementation TUIElementRegistry

- (TUIElementRegistry)init
{
  TUIElementRegistry *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *elements;
  NSMutableSet *v6;
  NSMutableSet *features;
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
  objc_super v131;

  kdebug_trace(725408464, 8, 0, 0, 0);
  v131.receiver = self;
  v131.super_class = (Class)TUIElementRegistry;
  v3 = -[TUIElementRegistry init](&v131, "init");
  if (v3)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    elements = v3->_elements;
    v3->_elements = v4;

    v6 = objc_opt_new(NSMutableSet);
    features = v3->_features;
    v3->_features = v6;

    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTemplate, v8), CFSTR("template"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementLet, v9), CFSTR("let"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementVBox, v10), CFSTR("vbox"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHBox, v11), CFSTR("hbox"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementVSpacer, v12), CFSTR("vspacer"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHSpacer, v13), CFSTR("hspacer"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementImage, v14), CFSTR("image"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementImagePlain, v15), CFSTR("image/plain"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementGrid, v16), CFSTR("grid"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementRatings, v17), CFSTR("ratings"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSegmentedControl, v18), CFSTR("segmented-control"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSegmentedControlSegment, v19), CFSTR("segmented-control/segment"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStyledBox, v20), CFSTR("styled-box"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementGradient, v21), CFSTR("gradient"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHScroll, v22), CFSTR("hscroll"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementChart, v23), CFSTR("chart"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementControl, v24), CFSTR("control"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementButton, v25), CFSTR("button"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementButtonStateInstantiator, v26), CFSTR("button/state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementButtonStatesInstantiator, v27), CFSTR("button/states"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementButtonCustomContent, v28), CFSTR("button/state/custom"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementBind, v29), CFSTR("bind"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementInclude, v30), CFSTR("include"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementDefine, v31), CFSTR("define"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementInstantiate, v32), CFSTR("instantiate"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStyle, v33), CFSTR("style"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementCondition, v34), CFSTR("condition"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementIf, v35), CFSTR("if"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSwitch, v36), CFSTR("switch"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementCase, v37), CFSTR("case"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementProgress, v38), CFSTR("progress"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextField, v39), CFSTR("textfield"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextView, v40), CFSTR("textarea"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSearchBar, v41), CFSTR("search-bar"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementDynamicState, v42), CFSTR("dynamic-state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementVScroll, v43), CFSTR("vscroll"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementNavigationBarItem, v44), CFSTR("nav-bar-item"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTrigger, v45), CFSTR("trigger"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHFlow, v46), CFSTR("hflow"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimation, v47), CFSTR("animation"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationFrom, v48), CFSTR("animation/from"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationTo, v49), CFSTR("animation/to"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationKeyFrame, v50), CFSTR("animation/keyframe"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationSet, v51), CFSTR("animation/set"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationGroup, v52), CFSTR("animation-group"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAnimationGroupPhase, v53), CFSTR("animation-group/phase"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementViewState, v54), CFSTR("view-state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementNowPlaying, v55), CFSTR("now-playing"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTrackTimeRemaining, v56), CFSTR("time-remaining"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementExpandable, v57), CFSTR("expandable"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementYield, v58), CFSTR("yield"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSupported, v59), CFSTR("supported"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementLayoutOptions, v60), CFSTR("layout-options"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementLayoutOption, v61), CFSTR("layout-options/option"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementToggle, v62), CFSTR("toggle"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementMicaPlayer, v63), CFSTR("mica"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAction, v64), CFSTR("action"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementActionData, v65), CFSTR("action/data"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAXActions, v66), CFSTR("ax-actions"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAXActionsAction, v67), CFSTR("ax-actions/action"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStateInstantiator, v68), CFSTR("state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStatesInstantiator, v69), CFSTR("states"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSymbolImage, v70), CFSTR("symbol-image"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSymbolImagePlain, v71), CFSTR("symbol-image/plain"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementVisualEffect, v72), CFSTR("visual-effect"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementVideo, v73), CFSTR("video"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTBox, v74), CFSTR("text"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextPlain, v75), CFSTR("text/plain"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextAttributed, v76), CFSTR("text/attributed"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextFragmentInstantiator, v77), CFSTR("__text_fragment"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextStrInstantiator, v78), CFSTR("text/str"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextSpanInstantiator, v79), CFSTR("text/span"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextBInstantiator, v80), CFSTR("text/b"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextBInstantiator, v81), CFSTR("text/strong"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextIInstantiator, v82), CFSTR("text/i"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextIInstantiator, v83), CFSTR("text/em"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextAInstantiator, v84), CFSTR("text/a"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextDropCapInstantiator, v85), CFSTR("text/drop-cap"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextLineStylingInstantiator, v86), CFSTR("text/line-styling"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementTextParagraphStylingInstantiator, v87), CFSTR("text/par-styling"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementConfiguration, v88), CFSTR("configuration"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementConfigurationSection, v89), CFSTR("configuration/section"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementConfigurationData, v90), CFSTR("configuration/data"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementConfigurationFont, v91), CFSTR("configuration/font"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementWidgetSection, v92), CFSTR("widget/section"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementWidgetData, v93), CFSTR("widget/data"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementWidgetFont, v94), CFSTR("widget/font"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementMenu, v95), CFSTR("menu"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementMenuItem, v96), CFSTR("menu/item"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementGlobalsUse, v97), CFSTR("globals/use"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementComponent, v98), CFSTR("component"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementComponentRender, v99), CFSTR("render"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementComponentBind, v100), CFSTR("component/bind"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementComponentDynamicState, v101), CFSTR("component/dynamic-state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementComponentViewState, v102), CFSTR("component/view-state"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSmartGrid, v103), CFSTR("smart-grid"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSmartGridSection, v104), CFSTR("smart-grid/section"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSmartGridContent, v105), CFSTR("smart-grid/content"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSmartGridAdornments, v106), CFSTR("smart-grid/adornments"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementSmartGridAdornments, v107), CFSTR("smart-grid/section/adornments"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementGroup, v108), CFSTR("group"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementColumn, v109), CFSTR("column"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementRule, v110), CFSTR("rule"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementShelf, v111), CFSTR("shelf"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStruct, v112), CFSTR("struct"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStructStruct, v113), CFSTR("struct/struct"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStructProp, v114), CFSTR("struct/prop"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementAspectBox, v115), CFSTR("aspect-box"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementUnrestrictedBox, v116), CFSTR("unrestricted-box"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHoverRegion, v117), CFSTR("hover-region"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHoverVisible, v118), CFSTR("hover-visible"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementPageControl, v119), CFSTR("page-control"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementFocusItem, v120), CFSTR("focus-item"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHostedView, v121), CFSTR("hosted-view"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHostedAnchor, v122), CFSTR("hosted-anchor"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHostedAnchorDecorator, v123), CFSTR("nav-bar-item/hosted-anchor"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementHFade, v124), CFSTR("hfade"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementLinkEntity, v125), CFSTR("link-entity"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementLinkEntityAction, v126), CFSTR("link-entity/action"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementMediaBackdrop, v127), CFSTR("media-backdrop"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementGlobalsUse, v128), CFSTR("__globals_use"));
    -[TUIElementRegistry registerElementClass:withName:](v3, "registerElementClass:withName:", objc_opt_class(TUIElementStyledBox, v129), CFSTR("fill"));
    -[TUIElementRegistry registerFeature:](v3, "registerFeature:", CFSTR("blend-mode::gaussianBlur"));
    if ((_os_feature_enabled_impl("UIKit", "uip_floating_tab_bar") & 1) != 0
      || _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar_only"))
    {
      -[TUIElementRegistry registerFeature:](v3, "registerFeature:", CFSTR("uikit::uipFloatingTabBar"));
    }
  }
  kdebug_trace(725408464, 9, 0, 0, 0);
  return v3;
}

- (void)registerElementClass:(Class)a3 withName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elements, "setObject:forKeyedSubscript:", a3, a4);
}

- (Class)elementClassForName:(id)a3
{
  if (a3)
    return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->_elements, "objectForKeyedSubscript:");
  else
    return (Class)0;
}

- (void)registerFeature:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_features, "addObject:");
}

- (BOOL)supportFeature:(id)a3
{
  if (a3)
    return -[NSMutableSet containsObject:](self->_features, "containsObject:");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
