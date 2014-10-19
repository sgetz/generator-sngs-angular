# generator-sngs-angular [![Build Status](https://secure.travis-ci.org/sgetz/generator-sngs-angular.png?branch=master)](https://travis-ci.org/sgetz/generator-sngs-angular)

> [Yeoman](http://yeoman.io) generator


## Getting Started

### What is Yeoman?

Trick question. It's not a thing. It's this guy:

![](http://i.imgur.com/JHaAlBJ.png)

Basically, he wears a top hat, lives in your computer, and waits for you to tell him what kind of application you wish to create.

Not every new computer comes with a Yeoman pre-installed. He lives in the [npm](https://npmjs.org) package repository. You only have to ask for him once, then he packs up and moves into your hard drive. *Make sure you clean up, he likes new and shiny things.*

```bash
npm install -g yo
```

### Yeoman Generators

Yeoman travels light. He didn't pack any generators when he moved in. You can think of a generator like a plug-in. You get to choose what type of application you wish to create, such as a Backbone application or even a Chrome extension.

To install generator-sngs-angular from npm, run:

```bash
npm install -g generator-sngs-angular
```

Finally, initiate the generator:

```bash
yo sngs-angular
```

### Getting To Know Yeoman

Yeoman has a heart of gold. He's a person with feelings and opinions, but he's very easy to work with. If you think he's too opinionated, he can be easily convinced.

If you'd like to get to know Yeoman better and meet some of his friends, [Grunt](http://gruntjs.com) and [Bower](http://bower.io), check out the complete [Getting Started Guide](https://github.com/yeoman/yeoman/wiki/Getting-Started).


## License

MIT

##Yeoman Generator API Properties

- `domain`
- `_events`
- `_maxListeners`
- `options`
- `_args`
- `_options`
- `_arguments`
- `_hooks`
- `_composedWith`
- `_conflicts`
- `appname`
- `arguments`
- `args`
- `env`
- `resolved`
- `description`
- `conflicter`
- `src`
- `dest`
- `config`
- `_sourceRoot`
- `gruntfile`
- `_running`
- `user`
- `shell`
- `pkg`
- `somePromptOption`
- `someOtherPromptOption`

##Yeoman Generator API Methods

- `async()`
- `_engine(source, data, options)`
- `log(msg, ctx)`
- `constructor()`
- `init()`
- `askFor()`
- `app()`
- `projectfiles()`
- `printConfig()`
- `cacheRoot()`
- `_prepCopy(source, destination, process)`
- `copy(source, destination, process)`
- `bulkCopy(source, destination, process)`
- `read(filepath, encoding)`
- `write(filepath, content, writeFile)`
- `checkForCollision(filepath, content, cb)`
- `template(source, destination, data, options)`
- `engine(body, data, options)`
- `_directory(source, destination, process, bulk)`
- `directory(source, destination, process)`
- `bulkDirectory(source, destination, process)`
- `fetch(url, destination, cb)`
- `extract(archive, destination, opts, cb)`
- `tarball(archive, destination, opts, cb)`
- `request(uri, options, callback)`
- `expand(pattern, options)`
- `expandFiles(pattern, options)`
- `isPathAbsolute()`
- `mkdir()`
- `runInstall(installer, paths, options, cb)`
- `installDependencies(options)`
- `bowerInstall(cmpnt, options, cb)`
- `npmInstall(pkgs, options, cb)`
- `_(value)`
- `remote()`
- `remoteDir(cache, cb)`
- `domUpdate(html, tagName, content, mode)`
- `append(html, tagName, content)`
- `prepend(html, tagName, content)`
- `appendToFile(path, tagName, content)`
- `prependToFile(path, tagName, content)`
- `generateBlock(blockType, optimizedPath, filesBlock, searchPath)`
- `appendFiles(htmlOrOptions, fileType, optimizedPath, sourceFileList, attrs, searchPath)`
- `attributes(attrs)`
- `appendScripts(html, optimizedPath, sourceFileList, attrs, searchPath)`
- `removeScript(html, scriptPath)`
- `appendStyles(html, optimizedPath, sourceFileList, attrs, searchPath)`
- `removeStyle(html, path)`
- `appendScriptsDir(html, optimizedPath, sourceScriptDir, attrs)`
- `appendStylesDir(html, optimizedPath, sourceStyleDir, attrs)`
- `readFileAsString(filePath)`
- `writeFileFromString(html, filePath)`
- `help()`
- `usage()`
- `desc(description)`
- `argumentsHelp()`
- `optionsHelp()`
- `prompt(questions, callback)`
- `invoke(namespace, options, cb)`
- `spawnCommand(command, args, opt)`
- `option(name, config)`
- `argument(name, config)`
- `parseOptions()`
- `checkRequiredArgs()`
- `run(args, cb)`
- `runHooks(cb)`
- `hookFor(name, config)`
- `defaultFor(name)`
- `composeWith(namespace, options, settings)`
- `rootGeneratorName()`
- `_setStorage()`
- `destinationRoot(rootPath)`
- `sourceRoot(rootPath)`
- `getCollisionFilter()`
- `determineAppname()`
- `setMaxListeners(n)`
- `emit(type)`
- `addListener(type, listener)`
- `on(type, listener)`
- `once(type, listener)`
- `removeListener(type, listener)`
- `removeAllListeners(type)`
- `listeners(type)`
- `toString()`
- `toLocaleString()`
- `valueOf()`
- `hasOwnProperty()`
- `isPrototypeOf()`
- `propertyIsEnumerable()`
