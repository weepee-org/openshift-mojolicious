FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install find xargs pwgen supervisor bash-completion psmisc tar postgresql mysql uuid libuuid curl wget git gcc hiredis hiredis-devel libidn expat socat zeromq3 lrzip redis perl-Algorithm-Diff perl-AppConfig perl-Archive-Tar perl-Archive-Zip perl-Authen-SASL perl-B-Lint perl-Business-ISBN perl-CPAN perl-CPANPLUS perl-Capture-Tiny perl-Carp-Clan perl-Clone perl-Config-Tiny perl-Crypt-DES perl-Crypt-OpenSSL-Bignum perl-Crypt-OpenSSL-RSA perl-Crypt-OpenSSL-Random perl-DBD-MySQL perl-DBD-Pg perl-DBI perl-DB_File perl-Data-Dumper perl-Devel-Cover perl-Devel-Leak perl-Devel-StackTrace perl-Devel-Symdump perl-Digest-MD5 perl-Digest-SHA perl-Digest-SHA1 perl-Encode perl-Env perl-Exception-Class perl-ExtUtils-CBuilder perl-ExtUtils-Depends perl-ExtUtils-Embed perl-ExtUtils-ParseXS perl-ExtUtils-PkgConfig perl-FCGI perl-File-Find-Rule perl-File-Find-Rule-Perl perl-File-Inplace perl-Filter perl-Font-AFM perl-Font-TTF perl-FreezeThaw perl-GD perl-GSSAPI perl-Git perl-Git-SVN perl-HTML-Parser perl-HTML-Tree  perl-IO-Socket-SSL perl-IO-Tty perl-IO-Zlib perl-IO-stringy perl-IPC-Run perl-Image-Base perl-Image-Info perl-Image-Xbm perl-Image-Xpm perl-Inline perl-Inline-Files perl-JSON-Pgit@github.com:weepee-org/openshift-mojolicious.gitP perl-LDAP perl-Locale-PO perl-MailTools perl-Module-Build perl-Module-CoreList perl-Module-Install perl-Module-Manifest perl-Module-Metadata perl-Module-ScanDeps perl-Mozilla-LDAP perl-Net-DNS perl-Net-Daemon perl-Net-LibIDN perl-Net-SSLeay perl-Net-Telnet perl-Newt perl-Number-Compare perl-Object-Accessor perl-Object-Deadly perl-PAR-Dist perl-PCP-LogImport perl-PCP-LogSummary perl-PCP-MMV perl-PCP-PMDA perl-PPI perl-PPI-HTML perl-Params-Validate perl-Parse-Yapp perl-PathTools perl-Perl-Critic perl-Perl-Critic-More perl-Perl-MinimumVersion perl-Perl-OSType perl-Pod-Escapes perl-Pod-POM perl-Pod-Parser perl-Pod-Perldoc perl-Pod-Plainer perl-Probe-Perl perl-SGMLSpm  perl-Sane perl-Sort-Versions perl-Storable perl-String-CRC32 perl-String-ShellQuote perl-Switch perl-Syntax-Highlight-Engine-Kate  perl-Sys-Syslog perl-TermReadKey perl-Text-Glob perl-Text-Iconv perl-Tie-IxHash perl-TimeDate perl-URI perl-Unicode-Map8 perl-Unicode-String perl-WWW-Curl perl-XML-Dumper perl-XML-Handler-YAWriter perl-XML-LibXML perl-XML-LibXSLT perl-XML-Parser perl-XML-SAX perl-XML-Simple perl-XML-Twig perl-XML-Writer perl-XML-XPath perl-constant perl-core perl-hivex perl-homedir perl-libintl perl-libs perl-libwww-perl perl-libxml-perl perl-local-lib perl-srpm-macros perl-threads perl-threads-shared perl-version perltidy perl perl-App-cpanminus perl-Archive-Extract perl-B-Keywords perl-Bit-Vector perl-Business-ISBN-Data perl-CGI perl-CGI-Session perl-CPAN-Changes perl-CPAN-Meta perl-CPAN-Meta-Requirements perl-CPAN-Meta-YAML perl-CPANPLUS-Dist-Build perl-CSS-Tiny perl-Carp perl-Class-Data-Inheritable perl-Class-ISA perl-Class-Inspector perl-Class-Load perl-Class-Load-XS perl-Class-Singleton perl-Compress-Raw-Bzip2 perl-Compress-Raw-Zlib perl-Config-Simple perl-Convert-ASN1 perl-Crypt-CBC perl-Crypt-PasswdMD5 perl-Crypt-SSLeay perl-DBD-SQLite perl-DBIx-Simple perl-Data-OptList perl-Data-Peek perl-Date-Calc perl-Date-Manip perl-DateTime perl-DateTime-Format-DateParse perl-DateTime-Locale perl-DateTime-TimeZone perl-Devel-CheckLib perl-Devel-Cycle perl-Devel-EnforceEncapsulation perl-Digest perl-Digest-HMAC perl-Dist-CheckConflicts perl-Email-Address perl-Encode-Detect perl-Encode-Locale perl-Error perl-Exporter perl-ExtUtils-Install perl-ExtUtils-MakeMaker perl-ExtUtils-Manifest perl-File-CheckTree perl-File-Copy-Recursive perl-File-Fetch perl-File-HomeDir perl-File-Listing perl-File-Path perl-File-Remove perl-File-ShareDir perl-File-Slurp perl-File-Temp perl-File-Which perl-File-pushd perl-GD-Barcode perl-Getopt-Long perl-HTML-Format perl-HTML-FormatText-WithLinks perl-HTML-FormatText-WithLinks-AndTables perl-HTML-Tagset perl-HTTP-Cookies perl-HTTP-Daemon perl-HTTP-Date perl-HTTP-Message perl-HTTP-Negotiate perl-HTTP-Tiny perl-Hook-LexWrap perl-IO-CaptureOutput perl-IO-Compress perl-IO-HTML perl-IO-Socket-IP perl-IO-String perl-IPC-Cmd perl-IPC-Run3 perl-JSON perl-LWP-MediaTypes perl-LWP-Protocol-https perl-List-MoreUtils perl-Locale-Codes perl-Locale-Maketext perl-Locale-Maketext-Gettext perl-Locale-Maketext-Simple perl-Log-Message perl-Log-Message-Simple perl-Mail-DKIM perl-Mail-SPF perl-Mixin-Linewise perl-Module-Implementation perl-Module-Load perl-Module-Load-Conditional perl-Module-Loaded perl-Module-Pluggable perl-Module-Runtime perl-Module-Signature perl-Mozilla-CA perl-Net-DNS-Resolver-Programmable perl-Net-HTTP perl-Net-SMTP-SSL perl-NetAddr-IP perl-PPIx-Regexp perl-PPIx-Utilities perl-Package-Constants perl-Package-DeprecationManager perl-Package-Generator perl-Package-Stash perl-Package-Stash-XS perl-PadWalker perl-Parallel-Iterator perl-Params-Check perl-Params-Util perl-Parse-CPAN-Meta perl-Parse-RecDescent perl-PlRPC perl-Pod-Checker perl-Pod-Coverage perl-Pod-Coverage-TrustPod perl-Pod-Eventual perl-Pod-LaTeX perl-Pod-Simple perl-Pod-Spell perl-Pod-Usage perl-Readonly perl-Readonly-XS perl-Scalar-List-Utils perl-Socket perl-String-Format perl-String-Similarity perl-Sub-Exporter perl-Sub-Install perl-Sub-Uplevel perl-Taint-Runtime perl-Task-Weaken perl-Template-Toolkit perl-Term-UI perl-Test-CPAN-Meta perl-Test-ClassAPI perl-Test-Deep perl-Test-Differences perl-Test-DistManifest perl-Test-EOL perl-Test-Fatal perl-Test-Inter perl-Test-Memory-Cycle perl-Test-NoTabs perl-Test-NoWarnings perl-Test-Object perl-Test-Output perl-Test-Perl-Critic-Policy perl-Text-CSV_XS perl-Text-CharWidth perl-Text-Diff perl-Text-ParseWords perl-Text-Soundex perl-Text-Unidecode perl-Text-WrapI18N perl-Thread-Queue perl-Time-HiRes perl-Time-Local perl-Time-Piece perl-Tree-DAG_Node perl-Try-Tiny perl-UNIVERSAL-can perl-UNIVERSAL-isa perl-Version-Requirements perl-WWW-RobotRules perl-XML-Catalog perl-XML-DOM perl-XML-Filter-BufferText perl-XML-Grove perl-XML-NamespaceSupport perl-XML-RegExp perl-XML-SAX-Base perl-XML-SAX-Writer perl-XML-TokeParser perl-XML-TreeBuilder perl-XML-XPathEngine perl-YAML perl-YAML-Syck perl-YAML-Tiny perl-autodie perl-gettext perl-macros perl-parent perl-podlators perl-prefork perl-Test-LeakTrace perl-Test-Warn perl-Test-Fatal perl-Test-SharedFork perl-Test-Requires perl-Test-Kwalitee perl-Test-Kwalitee-Extra perl-Test-Deep perl-Test-UseAllModules perl-Test-FailWarnings perl-Test-Without-Module perl-Test-CheckDeps perl-Test-NoWarnings perl-Test-Warnings perl-Test-Object perl-Test-SubCalls perl-IO-Socket-INET6 perl-Socket6 perl-JSON-XS perl-Sys-Hostname-Long perl-Redis sox && yum clean all -y

RUN cpanm Mojolicious Redis::Fast Mojo::JSON Mojolicious::Plugin::RenderFile Mojolicious::Plugin::Sentry Data::GUID Time::Interval EV AnyEvent AnyEvent::DNS File::Basename Mojo::IOLoop AnyEvent::HTTP AnyEvent::HTTP::Request File::Touch Config::YAML WebService::HipChat Data::Validate::URI File::Sync

RUN cpanm -f AnyEvent::WebSocket::Client

RUN cpanm XML::Loy XML::XML2JSON JSON::Syck;

# Build Debug
RUN find /root/.cpanm/work/*/build.log | xargs cat

# Run scripts
ADD scripts/run.sh /scripts/run.sh

# Make executable
RUN chmod a+rx /scripts/run.sh

# Your app
ADD app/mojo.pl /app/mojo.pl

# Exposed Port
EXPOSE 3000

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/scripts/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Mojolicious" \
      io.k8s.display-name="mojolicious centos7 epel" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,mojolicious,perl" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
