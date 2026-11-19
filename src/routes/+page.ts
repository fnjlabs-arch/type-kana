import type { PageLoad } from "./$types"

export const load: PageLoad = async ({ fetch }) => {
	const res = await fetch("https://api.github.com/repos/fnjlabs-arch/type-kana")
	const { stargazers_count } = await res.json()
	return {
		stargazers: stargazers_count
	}
}
