# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler32@1.2.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.2
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	allocator-api2@0.2.16
	anstyle@1.0.6
	askama@0.12.1
	askama_derive@0.12.5
	askama_escape@0.10.3
	askama_parser@0.2.1
	async-trait@0.1.77
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.7
	bitflags@1.3.2
	bitflags@2.4.2
	block-buffer@0.10.4
	brotli-decompressor@2.5.1
	brotli@3.4.0
	bstr@1.9.1
	build_html@2.4.0
	bytes@1.5.0
	cached@0.48.1
	cached_proc_macro@0.19.1
	cached_proc_macro_types@0.1.1
	cc@1.0.89
	cfg-if@1.0.0
	clap@4.5.1
	clap_builder@4.5.1
	clap_lex@0.7.0
	cookie@0.18.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	core2@0.4.0
	cpufeatures@0.2.12
	crc32fast@1.4.0
	crypto-common@0.1.6
	darling@0.14.4
	darling_core@0.14.4
	darling_macro@0.14.4
	dary_heap@0.3.6
	deranged@0.3.11
	digest@0.10.7
	dotenvy@0.15.7
	env_logger@0.10.2
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.1
	fnv@1.0.7
	form_urlencoded@1.2.1
	fs_extra@1.3.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-io@0.3.30
	futures-lite@2.2.0
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.12
	gimli@0.28.1
	globset@0.4.14
	h2@0.3.24
	hashbrown@0.13.2
	hashbrown@0.14.3
	hermit-abi@0.3.9
	http-body@0.4.6
	http@0.2.12
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper-rustls@0.25.0
	hyper@0.14.28
	ident_case@1.0.1
	idna@0.5.0
	indexmap@2.2.5
	instant@0.1.12
	is-terminal@0.4.12
	itoa@1.0.10
	libc@0.2.153
	libflate@2.0.0
	libflate_lz77@2.0.0
	linux-raw-sys@0.4.13
	lipsum@0.9.0
	lock_api@0.4.11
	log@0.4.21
	memchr@2.7.1
	mime@0.3.17
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.11
	nom@7.1.3
	num-conv@0.1.0
	num_cpus@1.16.0
	num_threads@0.1.7
	object@0.32.2
	once_cell@1.19.0
	openssl-probe@0.1.5
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	percent-encoding@2.3.1
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	pretty_env_logger@0.5.0
	proc-macro2@1.0.78
	quick-error@1.2.3
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	regex-automata@0.4.6
	regex-syntax@0.8.2
	regex@1.10.3
	ring@0.17.8
	rle-decode-fast@1.0.3
	route-recognizer@0.3.1
	rust-embed-impl@8.3.0
	rust-embed-utils@8.3.0
	rust-embed@8.3.0
	rustc-demangle@0.1.23
	rustix@0.38.31
	rustls-native-certs@0.7.0
	rustls-pemfile@2.1.1
	rustls-pki-types@1.3.1
	rustls-webpki@0.102.2
	rustls@0.22.2
	rusty-forkfork@0.4.0
	ryu@1.0.17
	same-file@1.0.6
	schannel@0.1.23
	scopeguard@1.2.0
	sealed_test@1.0.0
	sealed_test_derive@1.0.0
	security-framework-sys@2.9.1
	security-framework@2.9.2
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.114
	serde_spanned@0.6.5
	serde_yaml@0.9.32
	sha2@0.10.8
	signal-hook-registry@1.4.1
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.5.6
	spin@0.9.8
	strsim@0.10.0
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.52
	tempfile@3.10.1
	termcolor@1.4.1
	thiserror-impl@1.0.57
	thiserror@1.0.57
	time-core@0.1.2
	time-macros@0.2.17
	time@0.3.34
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-rustls@0.25.0
	tokio-util@0.7.10
	tokio@1.36.0
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.22.6
	tower-service@0.3.2
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	typenum@1.17.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unsafe-libyaml@0.2.10
	untrusted@0.9.0
	url@2.5.0
	uuid@1.7.0
	version_check@0.9.4
	wait-timeout@0.2.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	winnow@0.6.5
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
	zeroize@1.7.0
"

inherit cargo

DESCRIPTION="Alternative private front-end to Reddit"
HOMEPAGE="https://github.com/redlib-org/redlib"
SRC_URI="https://github.com/redlib-org/redlib/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="AGPL-3"
# Dependent crate licenses
LICENSE+="
	BSD ISC MIT Unicode-DFS-2016 ZLIB
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="acct-user/redlib
	acct-group/redlib"

src_install(){
	cargo_src_install
	newinitd "${FILESDIR}"/redlib.initd redlib
	doconfd "${FILESDIR}"/redlib
}