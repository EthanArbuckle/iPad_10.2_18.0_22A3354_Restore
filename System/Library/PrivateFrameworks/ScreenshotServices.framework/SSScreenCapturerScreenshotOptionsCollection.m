@implementation SSScreenCapturerScreenshotOptionsCollection

- (void)setScreenshotOptions:(id)a3 forScreen:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMapTable *screenToScreenshotOptions;
  NSMapTable *v10;
  NSMapTable *v11;
  NSMapTable *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  screenToScreenshotOptions = self->_screenToScreenshotOptions;
  if (v13)
  {
    if (!screenToScreenshotOptions)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v11 = self->_screenToScreenshotOptions;
      self->_screenToScreenshotOptions = v10;

      v7 = v13;
      screenToScreenshotOptions = self->_screenToScreenshotOptions;
    }
    -[NSMapTable setObject:forKey:](screenToScreenshotOptions, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMapTable removeObjectForKey:](screenToScreenshotOptions, "removeObjectForKey:", v8);
    if (!-[NSMapTable count](self->_screenToScreenshotOptions, "count"))
    {
      v12 = self->_screenToScreenshotOptions;
      self->_screenToScreenshotOptions = 0;

    }
  }

}

- (id)screenshotOptionsForScreen:(id)a3
{
  return -[NSMapTable objectForKey:](self->_screenToScreenshotOptions, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenToScreenshotOptions, 0);
}

@end
