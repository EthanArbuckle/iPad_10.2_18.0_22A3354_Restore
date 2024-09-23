@implementation TVInterfaceFactory

- (void)setExtendedInterfaceCreator:(id)a3
{
  TVInterfaceCreating *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  int v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 extenderFlags;
  int v21;
  TVInterfaceCreating *v22;

  v5 = (TVInterfaceCreating *)a3;
  if (self->_extendedInterfaceCreator != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_extendedInterfaceCreator, a3);
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFDF | v10;
    v11 = -[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88);
    v12 = 0;
    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 64;
      else
        v12 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFFBF | v12;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 128;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFF7F | v13;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 1024;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFBFF | v14;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = 256;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFEFF | v15;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 2048;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xF7FF | v16;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = 512;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xFDFF | v17;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 4096;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xEFFF | v18;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 0x4000;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    extenderFlags = (__int16)self->_extenderFlags;
    *(_WORD *)&self->_extenderFlags = extenderFlags & 0xBFFF | v19;
    if (-[TVInterfaceCreating conformsToProtocol:](v22, "conformsToProtocol:", &unk_2557DFF88))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = 0x2000;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    *(_WORD *)&self->_extenderFlags = *(_WORD *)&self->_extenderFlags & 0xDFFF | v21;
    v5 = v22;
    if (v21 | extenderFlags & 0x2000)
    {
      -[TVStyleSheetRegistry commitStyleSheets](self->_styleSheetRegistry, "commitStyleSheets");
      v5 = v22;
    }
  }

}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setup");

  }
}

- (void)setup
{
  TVMLViewFactory *v3;
  TVMLViewFactory *viewFactory;
  _TVLockupFactory *v5;
  _TVLockupFactory *lockupFactory;
  _TVControllerFactory *v7;
  _TVControllerFactory *controllerFactory;
  _TVTemplateFactory *v9;
  _TVTemplateFactory *templateFactory;
  TVStyleSheetRegistry *v11;
  TVStyleSheetRegistry *styleSheetRegistry;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = objc_alloc_init(TVMLViewFactory);
  viewFactory = self->_viewFactory;
  self->_viewFactory = v3;

  v5 = objc_alloc_init(_TVLockupFactory);
  lockupFactory = self->_lockupFactory;
  self->_lockupFactory = v5;

  v7 = objc_alloc_init(_TVControllerFactory);
  controllerFactory = self->_controllerFactory;
  self->_controllerFactory = v7;

  v9 = objc_alloc_init(_TVTemplateFactory);
  templateFactory = self->_templateFactory;
  self->_templateFactory = v9;

  v11 = objc_alloc_init(TVStyleSheetRegistry);
  styleSheetRegistry = self->_styleSheetRegistry;
  self->_styleSheetRegistry = v11;

  v34 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemMidGrayColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "colorWithAlphaComponent:", 0.8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.37254902, 0.411764706, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.921568627, 0.0431372549, 0.333333333, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.968627451, 0.568627451, 0.282352941, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.968627451, 0.709803922, 0.11372549, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.905882353, 0.788235294, 0.243137255, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.823529412, 0.839215686, 0.352941176, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.603921569, 0.819607843, 0.356862745, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.419607843, 0.796078431, 0.403921569, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.368627451, 0.776470588, 0.541176471, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.360784314, 0.749019608, 0.725490196, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.196078431, 0.694117647, 0.780392157, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.298039216, 0.678431373, 0.878431373, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.423529412, 0.705882353, 1.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.552941176, 0.596078431, 1.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.674509804, 0.541176471, 1.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.384313725, 0.698039216, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.929411765, 0.4, 0.509803922, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v31, CFSTR("systemteal"), v30, CFSTR("systemgray"), v29, CFSTR("systemmidgray"), v28, CFSTR("keyblue"), v27, CFSTR("keyblue-highlighted"), v38, CFSTR("orange1"), v26, CFSTR("orange2"), v25, CFSTR("orange3"), v24,
    CFSTR("yellow1"),
    v37,
    CFSTR("yellow2"),
    v36,
    CFSTR("yellow3"),
    v33,
    CFSTR("green1"),
    v23,
    CFSTR("green2"),
    v22,
    CFSTR("green3"),
    v21,
    CFSTR("blue1"),
    v20,
    CFSTR("blue2"),
    v19,
    CFSTR("blue3"),
    v18,
    CFSTR("blue4"),
    v17,
    CFSTR("purple1"),
    v16,
    CFSTR("purple2"),
    v13,
    CFSTR("pink"),
    v14,
    CFSTR("coral"),
    0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51978], "registerColorNameMap:", v35);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__darkerSystemColorStatusChanged_, *MEMORY[0x24BDF7230], 0);

}

- (void)_registerViewControllerCreator:(id)a3 withType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__TVInterfaceFactory__registerViewControllerCreator_withType___block_invoke;
  v8[3] = &unk_24EB86D70;
  v9 = v6;
  v7 = v6;
  -[TVInterfaceFactory _registerViewControllerCreatorEx:withType:](self, "_registerViewControllerCreatorEx:withType:", v8, a4);

}

- (void)_registerViewControllerCreatorEx:(id)a3 withType:(unint64_t)a4
{
  NSMutableDictionary *viewControllerCreatorsByKey;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(a3, "copy");
    viewControllerCreatorsByKey = self->_viewControllerCreatorsByKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](viewControllerCreatorsByKey, "setObject:forKeyedSubscript:", v8, v7);

  }
}

+ (id)sharedInterfaceFactory
{
  if (sharedInterfaceFactory_onceToken != -1)
    dispatch_once(&sharedInterfaceFactory_onceToken, &__block_literal_global_30);
  return (id)sharedInterfaceFactory_sSharedInstance;
}

- (void)_registerViewCreator:(id)a3 withType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__TVInterfaceFactory__registerViewCreator_withType___block_invoke;
  v8[3] = &unk_24EB86D48;
  v9 = v6;
  v7 = v6;
  -[TVInterfaceFactory _registerViewCreatorEx:withType:](self, "_registerViewCreatorEx:withType:", v8, a4);

}

- (void)_registerViewCreatorEx:(id)a3 withType:(unint64_t)a4
{
  NSMutableDictionary *viewCreatorsByKey;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(a3, "copy");
    viewCreatorsByKey = self->_viewCreatorsByKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](viewCreatorsByKey, "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (id)_styleSheetURLForTemplate:(id)a3
{
  void *v3;
  id v5;
  void *v6;

  if ((*(_WORD *)&self->_extenderFlags & 0x2000) != 0)
  {
    v5 = a3;
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_styleSheetURLForTemplate:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __38__TVInterfaceFactory__tvmlResourceMap__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_tvmlResourceMap_sDict;
  _tvmlResourceMap_sDict = (uint64_t)v0;

  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-cloud"), CFSTR("button-cloud"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-play"), CFSTR("button-play"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-preview"), CFSTR("button-preview"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-add"), CFSTR("button-add"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-remove"), CFSTR("button-remove"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-add-alt"), CFSTR("button-add-alt"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-artist"), CFSTR("button-artist"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-curator"), CFSTR("button-curator"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-follow"), CFSTR("button-follow"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-checkmark"), CFSTR("button-checkmark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-more"), CFSTR("button-more"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-rate"), CFSTR("button-rate"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-rated"), CFSTR("button-rated"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-radio"), CFSTR("button-radio"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-shuffle"), CFSTR("button-shuffle"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_dropdown"), CFSTR("button-dropdown"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("button-open"), CFSTR("button-open"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_logo_white"), CFSTR("common-sense-logo-white"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_logo_black"), CFSTR("common-sense-logo-black"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_l"), CFSTR("common-sense-badge-white-l"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_m"), CFSTR("common-sense-badge-white-m"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_white_s"), CFSTR("common-sense-badge-white-s"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_s"), CFSTR("common-sense-badge-black-s"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_m"), CFSTR("common-sense-badge-black-m"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cs_badge_black_l"), CFSTR("common-sense-badge-black-l"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_chevron"), CFSTR("chevron"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("list-chevron"), CFSTR("list-chevron"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("game_center"), CFSTR("game_center"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("game_controller"), CFSTR("game_controller"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("bluetooth_accessory_mask"), CFSTR("bluetooth_accessory"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("watched-checkmark"), CFSTR("overlay-checkmark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_radio_small_mask"), CFSTR("radio-s"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("icon_cloud_mask"), CFSTR("cloud-s"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_lockup_badge"), CFSTR("extras-lockup-badge"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_preview_stamp"), CFSTR("extras-preview-stamp"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_lockup_badge_zh"), CFSTR("extras-lockup-badge_zh"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("extras_preview_stamp_zh"), CFSTR("extras-preview-stamp_zh"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ghost_episode_light"), CFSTR("episode-placeholder-light"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ghost_episode_dark"), CFSTR("episode-placeholder-dark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-brick"), CFSTR("content-gradient-brick"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-flowcase"), CFSTR("content-gradient-flowcase"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-genre-brick"), CFSTR("content-gradient-genre-brick"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-genre-brick-4"), CFSTR("content-gradient-genre-brick-4"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("content-gradient-list-keyframe"), CFSTR("content-gradient-list-keyframe"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cc_mask"), CFSTR("cc"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("hd_mask"), CFSTR("hd"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTRotten"), CFSTR("tomato-splat"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTFresh"), CFSTR("tomato-fresh"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTCertified"), CFSTR("tomato-certified"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeRotten"), CFSTR("tomato-splat-m"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeFresh"), CFSTR("tomato-fresh-m"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("RTLargeCertified"), CFSTR("tomato-certified-m"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("confirmation-checkmark"), CFSTR("confirmation-checkmark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("cloud-download-icon"), CFSTR("cloud-download-icon"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("download-checkmark"), CFSTR("download-checkmark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-add"), CFSTR("popover-add"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-chevron-up"), CFSTR("popover-chevron-up"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-chevron-down"), CFSTR("popover-chevron-down"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-share"), CFSTR("popover-share"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("popover-more"), CFSTR("popover-more"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Add"), CFSTR("ActionMenu-Add"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-circleMask"), CFSTR("ActionMenu-circleMask"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-ClearHistory"), CFSTR("ActionMenu-ClearHistory"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-ClearPlayHistory"), CFSTR("ActionMenu-ClearPlayHistory"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Mark"), CFSTR("ActionMenu-Mark"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-MarkAll"), CFSTR("ActionMenu-MarkAll"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Play"), CFSTR("ActionMenu-Play"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Remove"), CFSTR("ActionMenu-Remove"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-RemoveFromUpNext"), CFSTR("ActionMenu-RemoveFromUpNext"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("ActionMenu-Share"), CFSTR("ActionMenu-Share"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("Actions_CheckGlyph"), CFSTR("Actions-Check"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("Actions_AddGlyph"), CFSTR("Actions-Add"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("itunes-extras-badge"), CFSTR("extras-badge"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("guided-tour-play"), CFSTR("guided-tour-play"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("OnboardingPlayLarge"), CFSTR("onboarding-play-large"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("OnboardingPlaySmall"), CFSTR("onboarding-play-small"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("onboarding-hero"), CFSTR("onboarding-hero"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("onboarding-appicon"), CFSTR("onboarding-appicon"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("library-dropdown"), CFSTR("library-dropdown"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("metadata-ad"), CFSTR("metadata-ad"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("metadata-sdh"), CFSTR("metadata-sdh"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("hdr_mask"), CFSTR("hdr"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("4k_mask"), CFSTR("4k"));
  objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("dolbyvision_mask"), CFSTR("dolby-vision"));
  return objc_msgSend((id)_tvmlResourceMap_sDict, "setObject:forKeyedSubscript:", CFSTR("dolbyatmos_mask"), CFSTR("dolby-atmos"));
}

void __44__TVInterfaceFactory_sharedInterfaceFactory__block_invoke()
{
  TVInterfaceFactory *v0;
  void *v1;

  v0 = objc_alloc_init(TVInterfaceFactory);
  v1 = (void *)sharedInterfaceFactory_sSharedInstance;
  sharedInterfaceFactory_sSharedInstance = (uint64_t)v0;

}

- (TVInterfaceFactory)init
{
  TVInterfaceFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *viewCreatorsByKey;
  NSMutableDictionary *v5;
  NSMutableDictionary *viewControllerCreatorsByKey;
  NSMutableDictionary *v7;
  NSMutableDictionary *controllerTransitionCreatorsByKey;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVInterfaceFactory;
  v2 = -[TVInterfaceFactory init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    viewCreatorsByKey = v2->_viewCreatorsByKey;
    v2->_viewCreatorsByKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    viewControllerCreatorsByKey = v2->_viewControllerCreatorsByKey;
    v2->_viewControllerCreatorsByKey = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    controllerTransitionCreatorsByKey = v2->_controllerTransitionCreatorsByKey;
    v2->_controllerTransitionCreatorsByKey = v7;

  }
  return v2;
}

- (id)_resourceImageNamed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[TVInterfaceFactory _tvmlResourceMap](TVInterfaceFactory, "_tvmlResourceMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v3;
  v8 = v7;

  v9 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_tvmlResourceMap
{
  if (_tvmlResourceMap_onceToken != -1)
    dispatch_once(&_tvmlResourceMap_onceToken, &__block_literal_global_175);
  return (id)_tvmlResourceMap_sDict;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVInterfaceFactory;
  -[TVInterfaceFactory dealloc](&v4, sel_dealloc);
}

- (void)_darkerSystemColorStatusChanged:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("keyblue"), v6, CFSTR("keyblue-highlighted"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51978], "registerColorNameMap:", v7);
}

- (id)viewForElement:(id)a3 existingView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVInterfaceFactory _viewFromElement:existingView:](self, "_viewFromElement:existingView:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVInterfaceFactory _viewControllerFromElement:existingController:](self, "_viewControllerFromElement:existingController:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)URLForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if ((*(_WORD *)&self->_extenderFlags & 4) == 0
    || (-[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "URLForResource:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        _TVMLMetricsLogPublicAPIUsage(sel_URLForResource_),
        !v6))
  {
    +[TVInterfaceFactory _tvmlResourceMap](TVInterfaceFactory, "_tvmlResourceMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v4;
    v11 = v10;

    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVInterfaceFactory _URLForResource:bundle:](TVInterfaceFactory, "_URLForResource:bundle:", v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[TVMLUtilities TVUIKitBundle](TVMLUtilities, "TVUIKitBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVInterfaceFactory _URLForResource:bundle:](TVInterfaceFactory, "_URLForResource:bundle:", v4, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TVInterfaceFactory _URLForResource:bundle:](TVInterfaceFactory, "_URLForResource:bundle:", v4, v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v6;
}

- (id)imageForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((*(_WORD *)&self->_extenderFlags & 8) == 0
    || (-[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "imageForResource:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        _TVMLMetricsLogPublicAPIUsage(sel_imageForResource_),
        !v6))
  {
    -[TVInterfaceFactory _getImageFromURLorBundle:](self, "_getImageFromURLorBundle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (Class)collectionViewCellClassForElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVInterfaceFactory _collectionViewCellClassForElement:](self, "_collectionViewCellClassForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)playerViewControllerForPlayer:(id)a3
{
  void *v3;
  id v5;
  void *v6;

  if ((*(_WORD *)&self->_extenderFlags & 0x20) != 0)
  {
    v5 = a3;
    _TVMLMetricsLogPublicAPIUsage(sel_playerViewControllerForPlayer_);
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerViewControllerForPlayer:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __52__TVInterfaceFactory__registerViewCreator_withType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tv_elementType") != 33)
  {
    -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v5), "layoutWithLayout:element:", v6, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v7, "tv_setLayout:", v6);
      goto LABEL_7;
    }
    v8 = objc_opt_new();
LABEL_6:
    v9 = (void *)v8;
    objc_msgSend(v7, "tv_setLayout:", v8);

  }
LABEL_7:

  return v7;
}

uint64_t __62__TVInterfaceFactory__registerViewControllerCreator_withType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5
{
  -[_TVTemplateFactory registerProductTemplateURL:forTemplateName:includeParentStyleSheets:](self->_templateFactory, "registerProductTemplateURL:forTemplateName:includeParentStyleSheets:", a3, a4, a5);
}

- (id)_viewFromElement:(id)a3 existingView:(id)a4
{
  return -[TVInterfaceFactory _viewFromElement:layout:existingView:](self, "_viewFromElement:layout:existingView:", a3, 0, a4);
}

- (id)_viewFromElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int16 extenderFlags;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *viewCreatorsByKey;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v14 = 0;
    goto LABEL_28;
  }
  extenderFlags = (__int16)self->_extenderFlags;
  if ((extenderFlags & 0x40) == 0)
  {
    if ((extenderFlags & 1) != 0)
    {
      -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_associatedViewElement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewForElement:existingView:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v8), "layoutWithLayout:element:", v9, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tv_setLayout:", v15);

      _TVMLMetricsLogPublicAPIUsage(sel_viewForElement_existingView_);
      if (v14)
        goto LABEL_20;
    }
LABEL_8:
    viewCreatorsByKey = self->_viewCreatorsByKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "tv_elementType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](viewCreatorsByKey, "objectForKeyedSubscript:", v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = &unk_24EBCCBF8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_29:
        v14 = 0;
        goto LABEL_20;
      }
      v21 = &unk_24EBCCC10;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_viewCreatorsByKey, "objectForKeyedSubscript:", v21);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v20)
    {
LABEL_14:
      objc_msgSend(v10, "tv_associatedIKViewElement");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v10
        && (id)v22 == v8
        && !objc_msgSend(v8, "updateType")
        && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TVForceUpdate")),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "BOOLValue"),
            v24,
            (v25 & 1) == 0))
      {
        v26 = v10;
      }
      else
      {
        ((void (**)(_QWORD, id, id, id))v20)[2](v20, v8, v9, v10);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v26;

      goto LABEL_20;
    }
    goto LABEL_29;
  }
  -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_viewForIKElement:existingView:", v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v8), "layoutWithLayout:element:", v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tv_setLayout:", v17);

  if (!v14)
    goto LABEL_8;
LABEL_20:
  objc_msgSend(v14, "_transferAttributesFromElement:", v8);
  objc_msgSend(v8, "attributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "length"))
    objc_msgSend(v14, "tv_setAccessibilityText:", v28);
  objc_msgSend(v8, "attributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("data-siri"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tv_setSiriData:", v30);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "appDocument");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "templateElement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "tv_elementType");

    if (v33 == 71)
      objc_msgSend(v14, "tv_disableAnimation:forProperty:", 1, CFSTR("position"));
  }
  objc_msgSend(v14, "tv_setAssociatedIKViewElement:", v8);
  objc_msgSend(v8, "style");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "tv_layerFlipMode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("horizontal"));
  if (v35)
  {
    v37 = v36;
    objc_msgSend(v14, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFlipsHorizontalAxis:", v37);

  }
  objc_msgSend(v8, "tv_setProxyView:", v14);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("TVForceUpdate"));
  objc_msgSend(v8, "elementName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _TVMLMetricsLogElementUsage();

LABEL_28:
  return v14;
}

- (id)_viewControllerFromElement:(id)a3 existingController:(id)a4
{
  return -[TVInterfaceFactory _viewControllerFromElement:layout:existingController:](self, "_viewControllerFromElement:layout:existingController:", a3, 0, a4);
}

- (id)_viewControllerFromElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int16 extenderFlags;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *viewControllerCreatorsByKey;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    extenderFlags = (__int16)self->_extenderFlags;
    if ((extenderFlags & 0x80) != 0)
    {
      -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_viewControllerForIKElement:existingViewController:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_8:
        viewControllerCreatorsByKey = self->_viewControllerCreatorsByKey;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "tv_elementType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](viewControllerCreatorsByKey, "objectForKeyedSubscript:", v17);
        v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v10, "tv_associatedIKViewElement");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v10
            && (id)v19 == v8
            && !objc_msgSend(v8, "updateType")
            && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TVForceUpdate")),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v21, "BOOLValue"),
                v21,
                (v22 & 1) == 0))
          {
            v23 = v10;
          }
          else
          {
            ((void (**)(_QWORD, id, id, id))v18)[2](v18, v8, v9, v10);
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          v14 = v23;

        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      if ((extenderFlags & 2) == 0)
        goto LABEL_8;
      -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_associatedViewElement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewControllerForElement:existingViewController:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _TVMLMetricsLogPublicAPIUsage(sel_viewControllerForElement_existingViewController_);
      if (!v14)
        goto LABEL_8;
    }
    objc_msgSend(v14, "tv_setAssociatedIKViewElement:", v8);
    objc_msgSend(v8, "tv_setProxyView:", v14);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("TVForceUpdate"));
    objc_msgSend(v8, "elementName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _TVMLMetricsLogElementUsage();

    goto LABEL_18;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (Class)_extendedCollectionViewCellClassForIKElement:(id)a3
{
  id v4;
  __int16 extenderFlags;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  extenderFlags = (__int16)self->_extenderFlags;
  if ((extenderFlags & 0x100) != 0)
  {
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_collectionViewCellClassForIKElement:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  if ((extenderFlags & 0x10) != 0)
  {
    _TVMLMetricsLogPublicAPIUsage(sel_collectionViewCellClassForElement_);
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_associatedViewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewCellClassForElement:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return (Class)v6;
}

- (Class)_collectionViewCellClassForElement:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;

  v4 = a3;
  v5 = -[TVInterfaceFactory _extendedCollectionViewCellClassForIKElement:](self, "_extendedCollectionViewCellClassForIKElement:", v4);
  if (!v5)
  {
    objc_msgSend(v4, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "tv_elementType");

    if (v8 != 9 || (v5 = (objc_class *)objc_opt_class()) == 0)
    {
      v9 = objc_msgSend(v4, "tv_elementType");
      if (v9 == 8 || v9 == 24 || v9 == 23)
        v5 = (objc_class *)objc_opt_class();
      else
        v5 = 0;
    }
  }
  v10 = v5;

  return v10;
}

- (id)_imageProxyFromElement:(id)a3
{
  return -[TVInterfaceFactory _imageProxyFromElement:withLayout:](self, "_imageProxyFromElement:withLayout:", a3, 0);
}

- (id)_imageProxyFromElement:(id)a3 withLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((*(_WORD *)&self->_extenderFlags & 0x800) != 0)
  {
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_imageProxyForIKElement:withLayout:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(v6, "appDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequestLoader:", v12);

    goto LABEL_7;
  }
  if ((*(_WORD *)&self->_extenderFlags & 0x1000) != 0)
  {
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tv_associatedViewElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_imageProxyForElement:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_imageProxyForResourceURL:(id)a3 scaleToSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  TVImageProxy *v8;
  void *v9;
  TVImageProxy *v10;
  void *v12;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "tv_resourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [TVImageProxy alloc];
  +[_TVResourceImageLoader sharedInstance](_TVResourceImageLoader, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TVImageProxy initWithObject:imageLoader:groupType:](v8, "initWithObject:imageLoader:groupType:", v7, v9, 0);

  -[TVImageProxy setCacheOnLoad:](v10, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[TVInterfaceFactory imageForResource:](self, "imageForResource:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

      v10 = 0;
    }

  }
  return v10;
}

- (id)_imageProxyForSymbolURL:(id)a3 imageSymbolConfiguration:(id)a4 scaleToSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  _TVImageSymbolDescription *v10;
  TVImageProxy *v11;
  void *v12;
  TVImageProxy *v13;
  void *v15;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  objc_msgSend(a3, "tv_symbolName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_TVImageSymbolDescription initWithSymbolName:imageSymbolConfiguration:]([_TVImageSymbolDescription alloc], "initWithSymbolName:imageSymbolConfiguration:", v9, v8);
  v11 = [TVImageProxy alloc];
  +[_TVSymbolImageLoader sharedInstance](_TVSymbolImageLoader, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TVImageProxy initWithObject:imageLoader:groupType:](v11, "initWithObject:imageLoader:groupType:", v10, v12, 0);

  -[TVImageProxy setCacheOnLoad:](v13, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v9, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

      v13 = 0;
    }

  }
  return v13;
}

- (id)_navigationControllerForTabIdentifier:(id)a3
{
  void *v3;
  id v5;
  void *v6;

  if ((*(_WORD *)&self->_extenderFlags & 0x4000) != 0)
  {
    v5 = a3;
    -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_navigationControllerForTabIdentifier:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_registerControllerTransitioningCreator:(id)a3 withType:(unint64_t)a4
{
  NSMutableDictionary *controllerTransitionCreatorsByKey;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(a3, "copy");
    controllerTransitionCreatorsByKey = self->_controllerTransitionCreatorsByKey;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](controllerTransitionCreatorsByKey, "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (id)_controllerTransitionFromElement:(id)a3 toElement:(id)a4 forNavigationControllerOperation:(int64_t)a5 relativeToFrom:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSMutableDictionary *controllerTransitionCreatorsByKey;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  controllerTransitionCreatorsByKey = self->_controllerTransitionCreatorsByKey;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "tv_elementType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](controllerTransitionCreatorsByKey, "objectForKeyedSubscript:", v13);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    ((void (**)(_QWORD, id, id, int64_t, _BOOL8))v14)[2](v14, v10, v11, a5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_getImageFromURLorBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;

  v4 = a3;
  +[TVInterfaceFactory _tvmlResourceMap](TVInterfaceFactory, "_tvmlResourceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVUIKitBundle](TVMLUtilities, "TVUIKitBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:", v4, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v15 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageNamed:inBundle:", v4, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  -[TVInterfaceFactory URLForResource:](self, "URLForResource:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && objc_msgSend(v17, "isFileURL"))
  {
    v19 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v18, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithContentsOfFile:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v21;
  }
  if (!v12)
  {
    v22 = TVMLKitImageLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
      -[TVInterfaceFactory _getImageFromURLorBundle:].cold.1((uint64_t)v4, v22);
  }

  return v12;
}

+ (id)_URLForResource:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("jpg"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("lsr"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_willParseAppDocument:(id)a3 forImplicitUpdates:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  __int16 extenderFlags;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  id v32;

  v4 = a4;
  v32 = a3;
  objc_msgSend(v32, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (*(_WORD *)&self->_extenderFlags & 0x600) != 0)
  {
    v7 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v32, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {

      if (!objc_msgSend(v9, "count"))
      {

        goto LABEL_36;
      }
      objc_msgSend(v9, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      v10 = v4 ? objc_msgSend(v8, "implicitUpdateType") : objc_msgSend(v8, "updateType");
      v11 = v10;
      if (v10 >= 2)
        break;
      v12 = objc_msgSend(v8, "tv_isParsedOnce");
      if (v11 || (v12 & 1) == 0)
      {
LABEL_12:
        if ((objc_msgSend(v8, "tv_isParsedOnce") & 1) == 0)
        {
          extenderFlags = (__int16)self->_extenderFlags;
          -[TVInterfaceFactory extendedInterfaceCreator](self, "extendedInterfaceCreator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if ((extenderFlags & 0x200) != 0)
          {
            objc_msgSend(v8, "tv_associatedViewElement");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_parseAppConfigurationForElement:", v16);

          }
          else
          {
            objc_msgSend(v14, "_parseAppConfigurationForIKElement:", v8);
          }

          objc_msgSend(v8, "tv_setParsedOnce:", 1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "masterPrototypes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            v18 = 0;
            do
            {
              objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "insertObject:atIndex:", v19, v18);

              ++v18;
            }
            while (v18 < objc_msgSend(v17, "count"));
          }
          objc_msgSend(v8, "proxiedItemElements");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            v21 = 0;
            do
            {
              objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "insertObject:atIndex:", v22, v21);

              ++v21;
            }
            while (v21 < objc_msgSend(v20, "count"));
          }

        }
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        while (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectAtIndex:", 0);
          objc_msgSend(v25, "aliases");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObjectsFromArray:", v26);
          if (objc_msgSend(v26, "count"))
          {
            v27 = 0;
            do
            {
              objc_msgSend(v26, "objectAtIndexedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "insertObject:atIndex:", v28, v27);

              ++v27;
            }
            while (v27 < objc_msgSend(v26, "count"));
          }

          v23 = v24;
        }
        objc_msgSend(v8, "children");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "count"))
        {
          v30 = 0;
          do
          {
            objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "insertObject:atIndex:", v31, v30);

            ++v30;
          }
          while (v30 < objc_msgSend(v29, "count"));
        }

      }
    }
    objc_msgSend(v8, "tv_setParsedOnce:", 0);
    objc_msgSend(v8, "tv_isParsedOnce");
    goto LABEL_12;
  }
LABEL_36:

}

- (TVInterfaceCreating)extendedInterfaceCreator
{
  return self->_extendedInterfaceCreator;
}

- (TVStyleSheetRegistry)styleSheetRegistry
{
  return self->_styleSheetRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedInterfaceCreator, 0);
  objc_storeStrong((id *)&self->_styleSheetRegistry, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_lockupFactory, 0);
  objc_storeStrong((id *)&self->_viewFactory, 0);
  objc_storeStrong((id *)&self->_controllerTransitionCreatorsByKey, 0);
  objc_storeStrong((id *)&self->_viewControllerCreatorsByKey, 0);
  objc_storeStrong((id *)&self->_viewCreatorsByKey, 0);
}

- (void)_getImageFromURLorBundle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_222D98000, a2, OS_LOG_TYPE_ERROR, "resource not found: %@", (uint8_t *)&v2, 0xCu);
}

@end
